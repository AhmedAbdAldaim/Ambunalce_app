import 'package:ambulance/data/repositores/repositores.dart';
import 'package:ambulance/view_model/loginCubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final RepoImp repo;
  LoginCubit({required this.repo}) : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  //passworsVisable
  bool isVisablePassword = true;
  changePasswordVisable() {
    isVisablePassword = !isVisablePassword;
    emit(ChangePasswordVisableState());
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  FocusNode emailFoucs = FocusNode();
  FocusNode passWordFoucs = FocusNode();

  login() async {
    var res = await repo.loginRepo(
      body: {
        'email': email.text,
        'password': passWord.text,
      },
    );
    res.fold((l) {
      emit(FailureLoginState(message: l.message));
    }, (r) {
      emit(SuccessLoginState(r));
    });
  }
}
