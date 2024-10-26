import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/presentation/widgets/custom_textformfield_shape.dart';
import 'package:ambulance/view_model/loginCubit/login_cubit.dart';
import 'package:ambulance/view_model/loginCubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../config/app_routes.dart';
import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../data/data_sourse/local/shared_prefrence.dart';
import 'custom_login_private_police.dart';


class CustomLoginTextformfield extends StatelessWidget {
  const CustomLoginTextformfield({super.key} ); 
 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          context.loaderOverlay.hide();
          getIt
              .get<SharedPrefrencesHelper>()
              .setData(key: 'email', value: state.model.user!.email);
        getIt.get<SharedPrefrencesHelper>()
              .setData(key: 'name', value: state.model.user!.name);
          getIt
              .get<SharedPrefrencesHelper>()
              .setData(
                key: 'token',
                value: 'Bearer ${state.model.token.toString()}',
              )
              .then((i) {
            Navigator.pushNamed(
              context,
              AppRoutes.homeScreen,
            );
          });
        }
        if (state is FailureLoginState) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message.toString(),
            ),
          ));
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Card(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.04),
            child: Form(
              key: cubit.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextformfieldShape(
                    focusNode: cubit.emailFoucs,
                    titleTextFormField: AppString.email,
                    controller: cubit.email,
                    messageEmptyValidator: AppString.emptyemail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) => FocusScope.of(context)
                        .requestFocus(cubit.passWordFoucs),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  CustomTextformfieldShape(
                    focusNode: cubit.passWordFoucs,
                    titleTextFormField: AppString.password,
                    controller: cubit.passWord,
                    messageEmptyValidator: AppString.emptyPassword,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    isPass: cubit.isVisablePassword,
                    onPressedSuffuix: cubit.changePasswordVisable,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  CustomElevatedButton(
                    title: AppString.login,
                    showBackgroundColor: true,
                    addColorTitlle: true,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (cubit.key.currentState!.validate()) {
                        context.loaderOverlay.show();
                        cubit.login();
                      }
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('أو', style: AppStyles.textstyle03),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  CustomElevatedButton(
                    showBoarderColor: true,
                    title: 'تسجيل حساب جديد',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.registerScreen);
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  const CustomLoginPrivatePolice()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
