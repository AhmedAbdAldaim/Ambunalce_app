import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:ambulance/view_model/loginCubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../widgets/login/custom_login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).loadMapStyles();
    HomeCubit.get(context).requestEnableLocation(context);
    HomeCubit.get(context).requestPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).colorScheme.brightness;
    return LoaderOverlay(
      overlayColor: isdark == Brightness.dark
          ? Colors.white.withOpacity(0.3)
          : Colors.black.withOpacity(0.3),
      child: Scaffold(
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocProvider(
              create: (context) => getIt.get<LoginCubit>(),
              child: const CustomLoginBody(),
            ),
          ),
        ),
      ),
    );
  }
}
