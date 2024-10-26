import 'package:ambulance/data/model/auth_model.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class ChangePasswordVisableState extends RegisterState {}

final class LoadingRegisterState extends RegisterState {}

final class SuccessRegisterState extends RegisterState {
  final AuthModel model;
  SuccessRegisterState(this.model);
}

final class FailureRegisterState extends RegisterState {
  final String message;
  FailureRegisterState({required this.message});
}
