import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/data/repositores/repositores.dart';
import 'package:ambulance/view_model/ambunalceRequestCubit/ambunalce_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AmbunalceRequestCubit extends Cubit<AmbunalceRequestState> {
  final RepoImp repo;
  AmbunalceRequestCubit({required this.repo})
      : super(AmbunalceRequestInitial());

  static AmbunalceRequestCubit get(BuildContext context) =>
      BlocProvider.of(context);

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController message = TextEditingController();
  FocusNode nameFoucs = FocusNode();
  FocusNode phonenNumberFoucs = FocusNode();
  FocusNode locationFoucs = FocusNode();
  FocusNode messageFoucs = FocusNode();
  int statusID = 1;
  int serviceID = 1;
  int sectorID = 1;
  changeStatus({required statusId}) {
    statusID = statusId;
    emit(ChangeStatusTypeState());
  }

  changeService({required serviceId}) {
    serviceID = serviceId;
    emit(ChangeServiceTypeState());
  }

  changeSector({required sectorId}) {
    sectorID = sectorId;
    emit(ChangeSectorTypeState());
  }

  var pref = getIt.get<SharedPrefrencesHelper>();
  orderAmbunlce() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    var res = await repo.orderAmbunlceRepo(
      body: {
        'full_name': name.text.toString(),
        'phone': phoneNumber.text.toString(),
        'location': location.text.toString(),
        'lat': pref.getData(key: 'lat').toString(),
        'long': pref.getData(key: 'lng').toString(),
        "service_id": serviceID,
        "fitness_status_id": statusID,
        "sector_id": sectorID,
        "appointment_date": formattedDate,
        "appointment_time": formattedTime,
        "message": message.text.toString()
      },
    );
    res.fold((l) {
      emit(FailureAmbunalceRequestState(message: l.message));
    }, (r) {
      emit(SuccessAmbunalceRequestState(r));
    });
  }
}
