import 'package:ambulance/config/app_routes.dart';
import 'package:ambulance/config/app_theme.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/core/size_config.dart';
import 'package:ambulance/view_model/allOrderCubit/all_order_cubit.dart';
import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:ambulance/view_model/settingCubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmbulanceApp extends StatelessWidget {
  const AmbulanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<SettingCubit>()..loadThemeModeTheme(),
        ),
        BlocProvider(
          create: (context) => getIt.get<HomeCubit>()
            ..initialCameraPosition = const CameraPosition(
              zoom: 6,
            //  target: LatLng(24.4539, 54.3773)
               target: LatLng(15.5007, 32.5599),
            ),
        ),
          BlocProvider(
          create: (context) => getIt.get<AllOrdersCubit>()..getAllOrders(),
        ),
      ],
      child: BlocBuilder<SettingCubit, AppThemeMode>(
        builder: (context, state) => 
         MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ambulance',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: SettingCubit.get(context).getCurrentThemeMode(),
          onGenerateRoute: AppRoutes.route,
        ),
      ),
    );
  }
}
