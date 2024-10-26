import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/view_model/settingCubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, AppThemeMode>(builder: (context, state) {
      var cubit = SettingCubit.get(context);
      debugPrint(state.toString());
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppString.settings,
              style: AppStyles.textstyle04,
            ),
          ),
          body: Column(
            children: [
              RadioListTile<AppThemeMode>.adaptive(
                title: Text(
                  AppString.darkMode,
                  style: AppStyles.textstyle04,
                ),
                value: AppThemeMode.dark,
                groupValue: state,
                onChanged: (val) {
                  cubit.saveMode(val!);
                },
              ),
              const Divider(),
              RadioListTile<AppThemeMode>.adaptive(
                title: Text(
                  AppString.lightMode,
                  style: AppStyles.textstyle04,
                ),
                value: AppThemeMode.light,
                groupValue: state,
                onChanged: (val) {
                      cubit.saveMode(val!);
                },
              ),
              const Divider(),
              RadioListTile<AppThemeMode>.adaptive(
                title: Text(
                  AppString.systemMode,
                  style: AppStyles.textstyle04,
                ),
                value: AppThemeMode.system,
                groupValue: state,
                onChanged: (val) {
                      cubit.saveMode(val!);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
