import 'package:ambulance/config/app_routes.dart';
import 'package:ambulance/core/size_config.dart';
import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';

class CustomHomeAmbunalceRequest extends StatelessWidget {
  final HomeCubit cubit;
  const CustomHomeAmbunalceRequest({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: SizeConfig.safeBlockHorizontal * 0.12,
        ),
        child: FloatingActionButton.large(
          backgroundColor: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
          onPressed: () {
            if (cubit.latitude != null && cubit.longitude != null) {
              debugPrint(
                'ok succest LAT: ${cubit.latitude}, Lang:${cubit.longitude}',
              );
              Navigator.pushNamed(context, AppRoutes.ambunalceRequestScreen);
            } else {
              cubit.requestEnableLocation(context);
            }
          },
          child: Text(
            'طلب إسعاف',
            textAlign: TextAlign.center,
            style: AppStyles.textstyle04.copyWith(color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
