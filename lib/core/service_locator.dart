import 'package:ambulance/core/helper/api_service.dart';
import 'package:ambulance/core/helper/network_info.dart';
import 'package:ambulance/data/data_sourse/remote/remote_data_sourse.dart';
import 'package:ambulance/data/repositores/repositores.dart';
import 'package:ambulance/view_model/ambunalceRequestCubit/ambunalce_request_cubit.dart';
import 'package:ambulance/view_model/allOrderCubit/all_order_cubit.dart';
import 'package:ambulance/view_model/loginCubit/login_cubit.dart';
import 'package:ambulance/view_model/registerCubit/register_cubit.dart';
import 'package:ambulance/view_model/settingCubit/setting_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_sourse/local/shared_prefrence.dart';
import '../view_model/homeCubit/home_cubit.dart';

GetIt getIt = GetIt.I;

Future<void> initGetIt() async {
// CUBIT
  getIt.registerFactory<LoginCubit>(() => LoginCubit(repo: getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(repo: getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  getIt.registerLazySingleton<AllOrdersCubit>(() => AllOrdersCubit(repo: getIt()));
  getIt.registerLazySingleton<SettingCubit>(() => SettingCubit());
  getIt.registerFactory<AmbunalceRequestCubit>(
      () => AmbunalceRequestCubit(repo: getIt()));

  getIt.registerLazySingleton(() => RepoImp(remoteDataSourseImp: getIt()));
  getIt.registerLazySingleton(() => RemoteDataSourseImp(apiService: getIt()));

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      dio: Dio(
        BaseOptions(
          baseUrl: 'https://appointment.mather-travel.com/api/',
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );

  var pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPrefrencesHelper>(
      () => SharedPrefrencesHelper(pref: pref),);

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfo(
      connectivity: Connectivity(),
    ),
  );
}
