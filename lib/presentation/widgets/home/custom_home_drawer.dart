import 'package:ambulance/config/app_routes.dart';
import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/core/helper/fun.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/presentation/widgets/home/custom_home_list_tile_drawer.dart';
import 'package:flutter/material.dart';
import '../../../core/app_icons.dart';
import '../custom_logo.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const CustomLogo(),
              CustomHomeListTileDrawer(
                icon: AppIcons.keditprofile,
                title: 'الطلبات السابقة',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.allOrdersScreen);
                },
              ),
              CustomHomeListTileDrawer(
                icon: AppIcons.kguide,
                title: 'دليل الإسعافات الأولية',
                onTap: () {
                  launchURL(url: AppString.firstAidGuideUrl);
                },
              ),
              CustomHomeListTileDrawer(
                icon: AppIcons.ksetting,
                title: 'الإعدادات',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settingsScreen);
                },
              ),
              CustomHomeListTileDrawer(
                icon: AppIcons.kabout,
                title: 'من نحن',
                onTap: () {},
              ),
              CustomHomeListTileDrawer(
                icon: AppIcons.kprivace,
                title: 'سياسية الخصوصية',
                onTap: () {
                  launchURL(url: AppString.privatePoliceUrl);
                },
              ),
              CustomHomeListTileDrawer(
                icon: AppIcons.kprivace,
                title: 'تسجيل خروج',
                onTap: () {
                  getIt.get<SharedPrefrencesHelper>().cleardata().then((v) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.loginScreen, (r) => false);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
