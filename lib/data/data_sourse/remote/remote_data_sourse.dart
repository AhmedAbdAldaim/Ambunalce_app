import 'package:ambulance/core/helper/api_service.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/data/model/auth_model.dart';
import 'package:ambulance/data/model/get_all_orders.dart';
import 'package:ambulance/data/model/order_abunalce_model.dart';

abstract class RemoteDataSourse {
  Future<AuthModel> singUp({required Map<String, dynamic> body});
  Future<AuthModel> login({required Map<String, dynamic> body});
  Future<OrderAmbunlaceModel> orderAmbunlace(
      {required Map<String, dynamic> body});
  Future<List<Appointment>> getAllOrders();
}

class RemoteDataSourseImp extends RemoteDataSourse {
  final ApiService apiService;
  RemoteDataSourseImp({required this.apiService});

  @override
  Future<AuthModel> login({required Map<String, dynamic> body}) async {
    var data = await apiService.postData(endPoint: 'auth/login', data: body);
    return AuthModel.fromJson(data);
  }

  @override
  Future<AuthModel> singUp({required Map<String, dynamic> body}) async {
    var data = await apiService.postData(endPoint: 'auth/register', data: body);
    return AuthModel.fromJson(data);
  }

  @override
  Future<OrderAmbunlaceModel> orderAmbunlace(
      {required Map<String, dynamic> body}) async {
    var data = await apiService.postData(
      endPoint: 'users/appointments',
      data: body,
      token: getIt.get<SharedPrefrencesHelper>().getData(key: 'token'),
    );
    return OrderAmbunlaceModel.fromJson(data);
  }

  @override
  Future<List<Appointment>> getAllOrders() async {
    var data = await apiService.getData(
      endPoint: 'users/appointments',
      token: getIt.get<SharedPrefrencesHelper>().getData(key: 'token'),
    );
    return data.map<Appointment>((item) => Appointment.fromJson(item)).toList();
  }
}
