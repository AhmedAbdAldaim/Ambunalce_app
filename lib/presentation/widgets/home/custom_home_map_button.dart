import 'package:ambulance/core/helper/fun.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/presentation/widgets/home/custom_home_icon_button.dart';
import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/app_icons.dart';
import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';

class CustomHomeMapButton extends StatelessWidget {
  final HomeCubit cubit;
  const CustomHomeMapButton({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHomeIconButton(
              icon: AppIcons.kcall,
              onPressed: () {
                launchTell();
              }),
          Expanded(
            child: Text(
              getIt.get<SharedPrefrencesHelper>().getData(key: 'name'),
              textAlign: TextAlign.center,
              style: AppStyles.textstyle04,
            ),
          ),
          Column(
            children: [
              CustomHomeIconButton(
                icon: AppIcons.kmenu,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 0.06,
              ),
              CustomHomeIconButton(
                icon: AppIcons.kmap,
                onPressed: () {
                  cubit.changeMapType();
                },
              ),
              CustomHomeIconButton(
                icon: AppIcons.klocation,
                onPressed: () {
                  cubit.moveToCurrentLocation();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
