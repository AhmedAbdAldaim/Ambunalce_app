import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { system, light, dark }

class SettingCubit extends Cubit<AppThemeMode> {
  SettingCubit() : super(AppThemeMode.system);
  static SettingCubit get(BuildContext context) => BlocProvider.of(context);

  loadThemeModeTheme() async{
    String? mode = await getIt.get<SharedPrefrencesHelper>().getData(key: 'mode');
    if (mode != null) {
      switch (mode) {
        case 'AppThemeMode.system':
          emit(AppThemeMode.system);
          break;
        case 'AppThemeMode.dark':
          emit(AppThemeMode.dark);
          break;
        case 'AppThemeMode.light':
          emit(AppThemeMode.light);
          break;
        default:
          emit(AppThemeMode.system);
      }
    } else {
      emit(AppThemeMode.system);
    }
  }

  saveMode(AppThemeMode appThemeMode) {
    getIt
        .get<SharedPrefrencesHelper>()
        .setData(key: 'mode', value: appThemeMode.toString())
        .then((val) {
      emit(appThemeMode);
    });
  }

  ThemeMode getCurrentThemeMode() {
    switch (state) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
