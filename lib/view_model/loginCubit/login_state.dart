import 'package:ambulance/data/model/auth_model.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangePasswordVisableState extends LoginState {}

final class LoadingLoginState extends LoginState {}

final class SuccessLoginState extends LoginState {
  final AuthModel model;
  SuccessLoginState(this.model);
}

final class FailureLoginState extends LoginState {
  final String message;
  FailureLoginState({required this.message});
}
