import 'package:ambulance/data/model/get_all_orders.dart';
import 'package:ambulance/data/repositores/repositores.dart';
import 'package:ambulance/view_model/allOrderCubit/all_orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllOrdersCubit extends Cubit<AllOrdersState> {
  final RepoImp repo;
  AllOrdersCubit({required this.repo}) : super(AllOrdersInitial());

  static AllOrdersCubit get(BuildContext context) => BlocProvider.of(context);

  List<Appointment>? appointmenrt;
  getAllOrders() async {
    emit(LoadingAllOrdersState());
    var res = await repo.allOrdersRepo();
    res.fold((l) {
      print(l.message.toString());
      emit(FailureAllOrdersState(message: l.message));
    }, (r) {
      appointmenrt = r;
      emit(SuccessAllOrdersState());
    });
  }

  String getStatus({required int status}) {
    switch (status) {
      case 0:
        return 'قيد المعالجة';
      case 1:
        return 'تمت الموافقة';
      case 2:
        return 'مكتملة';
      case 3:
        return 'مرفوصة';
      default:
        return 'قيد المعالجة';
    }
  }
}
