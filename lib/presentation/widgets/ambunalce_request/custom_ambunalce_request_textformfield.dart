import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/presentation/widgets/custom_textformfield_shape.dart';
import 'package:ambulance/view_model/ambunalceRequestCubit/ambunalce_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/custom_chioce_chip.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../view_model/ambunalceRequestCubit/ambunalce_request_cubit.dart';

class CustomAmbunalceRequestTextformfield extends StatelessWidget {
  const CustomAmbunalceRequestTextformfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AmbunalceRequestCubit, AmbunalceRequestState>(
      listener: (context, state) {
        if (state is SuccessAmbunalceRequestState) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'تم ارسال الطلب بنجاح!',
            ),
          ));
          Navigator.pop(context);
        }
        if (state is FailureAmbunalceRequestState) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message.toString(),
            ),
          ));
        }
      },
      builder: (context, state) {
        var cubit = AmbunalceRequestCubit.get(context);
        cubit.location.text = getIt
            .get<SharedPrefrencesHelper>()
            .getData(key: 'location')
            .toString();
        return Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Text(AppString.titleAmbunalceRequestForm,
                style: AppStyles.textstyle05),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 0.05,
                  bottom: SizeConfig.safeBlockVertical * 0.1),
              child: Card(
                child: Padding(
                  padding:
                      EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.04),
                  child: Form(
                    key: cubit.key,
                    child: SingleChildScrollView(
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
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(cubit.phonenNumberFoucs);
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.02,
                          ),
                          CustomTextformfieldShape(
                            focusNode: cubit.phonenNumberFoucs,
                            titleTextFormField: AppString.phone,
                            controller: cubit.phoneNumber,
                            isPhone: true,
                            messageEmptyValidator: AppString.emptyPhone,
                            keyboardType: TextInputType.phone,
                          
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(cubit.locationFoucs);
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.02,
                          ),
                          Text(
                            'طبيعة الحالة :',
                            style: AppStyles.textstyle04,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.01,
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: [
                              CustomChioceChip(
                                label: 'حالة عادية',
                                selected: cubit.statusID == 1,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeStatus(
                                      statusId: 1,
                                    );
                                  }
                                },
                              ),
                              CustomChioceChip(
                                label: 'حالة متوسطة',
                                selected: cubit.statusID == 2,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeStatus(
                                      statusId: 2,
                                    );
                                  }
                                },
                              ),
                              CustomChioceChip(
                                label: 'حالة حرجة',
                                selected: cubit.statusID == 3,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeStatus(
                                      statusId: 3,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.02,
                          ),
                          Text(
                            'نوع الخدمة :',
                            style: AppStyles.textstyle04,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.01,
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: [
                              CustomChioceChip(
                                label: 'نقل بين المستشفيات',
                                selected: cubit.serviceID == 1,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeService(
                                      serviceId: 1,
                                    );
                                  }
                                },
                              ),
                              CustomChioceChip(
                                label: 'استلام حالة طارئة',
                                selected: cubit.serviceID == 2,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeService(
                                      serviceId: 2,
                                    );
                                  }
                                },
                              ),
                              CustomChioceChip(
                                label: 'زيارة منزلية',
                                selected: cubit.serviceID == 3,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeService(
                                      serviceId: 3,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.02,
                          ),
                          Text(
                            'القطاع :',
                            style: AppStyles.textstyle04,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.01,
                          ),
                          Wrap(
                            spacing: 8.0,
                            children: [
                              CustomChioceChip(
                                label: 'الخرطوم',
                                selected: cubit.sectorID == 1,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeSector(
                                      sectorId: 1,
                                    );
                                  }
                                },
                              ),
                              CustomChioceChip(
                                label: 'امدرمان',
                                selected: cubit.sectorID == 2,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeSector(
                                      sectorId: 2,
                                    );
                                  }
                                },
                              ),
                              CustomChioceChip(
                                label: 'بحري',
                                selected: cubit.sectorID == 3,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    cubit.changeSector(
                                      sectorId: 3,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.02,
                          ),
                          CustomTextformfieldShape(
                            focusNode: cubit.locationFoucs,
                            titleTextFormField: 'الموقع الحالي',
                            controller: cubit.location,
                            messageEmptyValidator: 'الرجاء ادخال الموقع الحالي',
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.02,
                          ),
                          CustomTextformfieldShape(
                            focusNode: cubit.messageFoucs,
                            titleTextFormField: 'ماذا يحدث ...',
                            controller: cubit.message,
                            maxLines: 3,
                            messageEmptyValidator: 'الرجاء ادخال رسالة معبرة',
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: SizedBox(
                height: SizeConfig.safeBlockVertical * 0.07,
                child: CustomElevatedButton(
                  title: AppString.titleAmbunalceRequestForm,
                  showBackgroundColor: true,
                  addColorTitlle: true,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (cubit.key.currentState!.validate()) {
                      context.loaderOverlay.show();
                      cubit.orderAmbunlce();
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
