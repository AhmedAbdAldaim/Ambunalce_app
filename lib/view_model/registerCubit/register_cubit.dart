import 'package:ambulance/data/repositores/repositores.dart';
import 'package:ambulance/view_model/registerCubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RepoImp repo;
  RegisterCubit({required this.repo}) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  //passworsVisable
  bool isVisablePassword = true;
  changePasswordVisable() {
    isVisablePassword = !isVisablePassword;
    emit(ChangePasswordVisableState());
  }

  bool isVisableConfirmPassword = true;
  changeConfirmPasswordVisable() {
    isVisableConfirmPassword = !isVisableConfirmPassword;
    emit(ChangePasswordVisableState());
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  FocusNode nameFoucs = FocusNode();
  FocusNode emailFoucs = FocusNode();
  FocusNode passWordFoucs = FocusNode();
  FocusNode passwordConfirmFoucs = FocusNode();

  singUp() async {
    var res = await repo.singUpRepo(body: {
      'name': name.text,
      'email': email.text,
      'password': passWord.text
    });
    res.fold((l) {
      emit(FailureRegisterState(message: l.message));
    }, (r) {
      emit(SuccessRegisterState(r));
    });
  }
}
