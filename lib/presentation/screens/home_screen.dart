import 'package:ambulance/presentation/widgets/home/custom_home_body.dart';
import 'package:ambulance/presentation/widgets/home/custom_home_drawer.dart';
import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:ambulance/view_model/homeCubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    HomeCubit.get(context).requestPermission(context);
    HomeCubit.get(context).loadMapStyles();
    HomeCubit.get(context).requestEnableLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is RequestGetLocationSuccessState) {
          Future.delayed(const Duration(seconds: 3), () {
            cubit.moveToCurrentLocation();
          });
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          endDrawer: const CustomHomeDrawer(),
          body: CustomHomeBody(
            cubit: cubit,
          ),
        );
      },
    );
  }
}


/*
CameraZOOM for Google Map values:
#world View = 0 - 3
#country View = 4 - 6
#city View = 7 - 12
#street View = 13 - 17
#building View = 18 - 20
 */