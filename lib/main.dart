import 'package:ambulance/ambulance_app.dart';
import 'package:ambulance/core/bloc_observer.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const AmbulanceApp();
  }
}
