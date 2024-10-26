import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/core/size_config.dart';
import 'package:ambulance/core/widgets/custom_elevated_button.dart';
import 'package:ambulance/view_model/allOrderCubit/all_order_cubit.dart';
import 'package:ambulance/view_model/allOrderCubit/all_orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAllOrdersBody extends StatelessWidget {
  const CustomAllOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.safeBlockHorizontal * 0.04,
      ),
      child: BlocBuilder<AllOrdersCubit, AllOrdersState>(
        builder: (context, state) {
          var cubit = AllOrdersCubit.get(context);
          return state is FailureAllOrdersState
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        state.message.toString(),
                        style: AppStyles.textstyle03,
                      ),
                      CustomElevatedButton(
                          onPressed: () {
                            cubit.getAllOrders();
                          },
                          title: 'حاول مرة اخرى')
                    ],
                  ),
                )
              : cubit.appointmenrt != null
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'الاسم :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index].fullName
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                   SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      'الموقع :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index].location
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                   SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      'رقم الهاتف :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index].phone
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                   SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      'القطاع :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index].sector!.name
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                   SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      'الخدمة :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index].service!.name
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                   SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      'الحالة :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index]
                                            .fitnessStatus!.name
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                       SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      'التقرير الطبي :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.appointmenrt![index].medicalReport
                                            .toString(),
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                                    SizedBox(height: SizeConfig.safeBlockVertical*0.01,),
                                Row(
                                  children: [
                                    Text(
                                      ' التاريخ - الوقت :',
                                      style: AppStyles.textstyle04
                                          .copyWith(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${cubit.appointmenrt![index].appointmentDate.toString()} | ${cubit.appointmenrt![index].appointmentTime.toString()}',
                                        style: AppStyles.textstyle04,
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: SizeConfig.safeBlockVertical*0.02,),
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Text(
                                    cubit
                                        .getStatus(
                                            status: cubit
                                                .appointmenrt![index].status)
                                        .toString(),
                                    style: AppStyles.textstyle04
                                        .copyWith(color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: cubit.appointmenrt!.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: SizeConfig.safeBlockVertical * 0.02,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
