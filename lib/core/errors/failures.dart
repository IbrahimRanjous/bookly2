import 'package:dio/dio.dart';

abstract class Failure {
  final String errMesage;

  Failure(this.errMesage);
  String getErrMesage() => errMesage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errMesage);

  factory ServerFailure.fromDioExcepiton(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate ");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Requist to ApiServer was canceld");

      case DioExceptionType.connectionError:
        return ServerFailure("No Internet connection");

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketExcetion')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure("Enexpected Error , Please try later");
      default:
        return ServerFailure('Opps There was an Error , Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error , Please try again later ");
    } else {
      return ServerFailure('Opps There was an Error , Please try again');
    }
  }
}
