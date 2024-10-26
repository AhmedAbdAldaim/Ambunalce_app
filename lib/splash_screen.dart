import 'package:ambulance/config/app_routes.dart';
import 'package:ambulance/core/app_images.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/core/size_config.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var token = getIt.get<SharedPrefrencesHelper>().getData(key: 'token');
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((val) {
      Navigator.pushReplacementNamed(
        context,
       token!=null?AppRoutes.homeScreen: AppRoutes.loginScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppImages.logoPng,
            width: SizeConfig.safeBlockHorizontal * 0.60,
            height: SizeConfig.safeBlockVertical * 0.40,
          ),
        ),
      ),
    );
  }
}
