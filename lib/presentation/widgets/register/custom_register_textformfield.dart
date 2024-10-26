import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/presentation/widgets/custom_textformfield_shape.dart';
import 'package:ambulance/view_model/registerCubit/register_cubit.dart';
import 'package:ambulance/view_model/registerCubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../config/app_routes.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class CustomRegisterTextformfield extends StatelessWidget {
  const CustomRegisterTextformfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          context.loaderOverlay.hide();
           getIt
              .get<SharedPrefrencesHelper>()
              .setData(key: 'email', value: state.model.user!.email);
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
            print(state.model.token);
          });
        }
        if (state is FailureRegisterState) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message.toString(),
            ),
          ));
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
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
                    focusNode: cubit.nameFoucs,
                    titleTextFormField: AppString.name,
                    controller: cubit.name,
                    messageEmptyValidator: AppString.emptyName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    isUserName: true,
                    messsageLenghtUserNameValidator: AppString.userNameLenght,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(cubit.emailFoucs),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
             
                  CustomTextformfieldShape(
                    titleTextFormField: AppString.email,
                    focusNode: cubit.emailFoucs,
                    controller: cubit.email,
                    messageEmptyValidator: AppString.emptyemail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    isUserName: true,
                    onFieldSubmitted: (value) => FocusScope.of(context)
                        .requestFocus(cubit.passWordFoucs),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  CustomTextformfieldShape(
                    titleTextFormField: AppString.password,
                    focusNode: cubit.passWordFoucs,
                    controller: cubit.passWord,
                    messageEmptyValidator: AppString.emptyPassword,
                    messsageLenghtPassValidator: AppString.passwordLenght,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    isPass: cubit.isVisablePassword,
                    onPressedSuffuix: cubit.changePasswordVisable,
                    onFieldSubmitted: (value) => FocusScope.of(context)
                        .requestFocus(cubit.passwordConfirmFoucs),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  CustomTextformfieldShape(
                    titleTextFormField: AppString.passwordConfirm,
                    controller: cubit.passwordConfirm,
                    focusNode: cubit.passwordConfirmFoucs,
                    messageEmptyValidator: AppString.emptypassConfirm,
                    messageCheckPasswordSimilarity:
                        AppString.checkPaswordSimilarity,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    isPass: cubit.isVisableConfirmPassword,
                    onPressedSuffuix: cubit.changeConfirmPasswordVisable,
                    passValue: cubit.passWord.text,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.02,
                  ),
                  CustomElevatedButton(
                    title: AppString.register,
                    showBackgroundColor: true,
                    addColorTitlle: true,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (cubit.key.currentState!.validate()) {
                        context.loaderOverlay.show();
                        cubit.singUp();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
