import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/presentation/widgets/register/custom_register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../view_model/registerCubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              create: (context) => getIt.get<RegisterCubit>(),
              child: const CustomRegisterBody(),
            ),
          ),
        ),
      ),
    );
  }
}
