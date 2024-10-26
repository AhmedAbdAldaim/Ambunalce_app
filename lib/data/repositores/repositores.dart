import 'package:ambulance/core/error/app_failure.dart';
import 'package:ambulance/data/data_sourse/remote/remote_data_sourse.dart';
import 'package:ambulance/data/model/auth_model.dart';
import 'package:ambulance/data/model/get_all_orders.dart';
import 'package:ambulance/data/model/order_abunalce_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class Repositores {
  Future<Either<AppFailure, AuthModel>> singUpRepo(
      {required Map<String, dynamic> body});
  Future<Either<AppFailure, AuthModel>> loginRepo(
      {required Map<String, dynamic> body});
  Future<Either<AppFailure, OrderAmbunlaceModel>> orderAmbunlceRepo(
      {required Map<String, dynamic> body});
  Future<Either<AppFailure, List<Appointment>>> allOrdersRepo();
}

class RepoImp extends Repositores {
  final RemoteDataSourseImp remoteDataSourseImp;
  RepoImp({required this.remoteDataSourseImp});

  @override
  Future<Either<AppFailure, AuthModel>> loginRepo(
      {required Map<String, dynamic> body}) async {
    try {
      var res = await remoteDataSourseImp.login(body: body);
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, AuthModel>> singUpRepo(
      {required Map<String, dynamic> body}) async {
    try {
      var res = await remoteDataSourseImp.singUp(body: body);
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, OrderAmbunlaceModel>> orderAmbunlceRepo(
      {required Map<String, dynamic> body}) async {
    try {
      var res = await remoteDataSourseImp.orderAmbunlace(body: body);
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<AppFailure, List<Appointment>>> allOrdersRepo() async{
     try {
      var res = await remoteDataSourseImp.getAllOrders();
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
