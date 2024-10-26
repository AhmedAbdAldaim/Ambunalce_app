import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/presentation/widgets/ambunalce_request/custom_ambunalce_request_body.dart';
import 'package:ambulance/view_model/ambunalceRequestCubit/ambunalce_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AmbunalceRequestScreen extends StatelessWidget {
  const AmbunalceRequestScreen({super.key});

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
                create: (context) => getIt.get<AmbunalceRequestCubit>(),
                child: const CustomAmbunalceRequestBody(),
              ),
            ),
          ),
        ));
  }
}
