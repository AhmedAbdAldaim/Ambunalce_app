import 'package:dio/dio.dart';

abstract class AppFailure {
  final String message;
  AppFailure({required this.message});
}

class OffLineFailure extends AppFailure {
  OffLineFailure()
      : super(message: 'هناك خطا في الاتصال بالانترنت حاول مرة اخرى!');
}

class ServerFailure extends AppFailure {
  ServerFailure({
    required super.message,
  });

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            message: 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            message: 'انتهت مهلة إرسال الطلب. يرجى المحاولة مرة أخرى.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            message: 'انتهت مهلة استقبال الرد. يرجى المحاولة مرة أخرى.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            message: 'شهادة غير صالحة. يرجى التحقق من الاتصال.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: e.response!.statusCode!,
          response: e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
            message: 'تم إلغاء الطلب. يرجى المحاولة مرة أخرى.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            message: 'خطأ في الاتصال. يرجى التحقق من اتصال الإنترنت.');
      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'حدث خطأ غير معروف. يرجى المحاولة لاحقاً.');
      default:
        return ServerFailure(
            message: 'حدث خطأ غير معروف. يرجى المحاولة لاحقاً.');
    }
  }
  factory ServerFailure.fromResponse({
    required int statusCode,
    dynamic response,
  }) {
    if (statusCode == 404) {
      return ServerFailure(message: 'طلبك غير موجود! حاول مرة اخرى!');
    } else if (statusCode == 500) {
      return ServerFailure(message: 'هناك مشكلة في الاتصال بالخادم! ');
    } else if (statusCode == 422) {
      return ServerFailure(message: response['errors']['email'][0]);
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response["errors"]["message"]);
    } else {
      return ServerFailure(message: 'حدث خطأ غير معروف. يرجى المحاولة لاحقاً.');
    }
  }
}
