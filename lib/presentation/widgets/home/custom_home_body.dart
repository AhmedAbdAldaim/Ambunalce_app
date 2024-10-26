import 'package:ambulance/presentation/widgets/home/custom_home_ambunalce_request.dart';
import 'package:ambulance/presentation/widgets/home/custom_home_google_map.dart';
import 'package:ambulance/presentation/widgets/home/custom_home_map_button.dart';
import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:ambulance/view_model/homeCubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeBody extends StatelessWidget {
  final HomeCubit cubit;
  const CustomHomeBody({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              CustomHomeGoogleMap(cubit: cubit),
              CustomHomeMapButton(cubit: cubit),
              CustomHomeAmbunalceRequest(cubit: cubit),
              if (cubit.isconnect &&  state is! MoveToCurrentLocationState)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
