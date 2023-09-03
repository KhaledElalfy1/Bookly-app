import 'package:dio/dio.dart';

abstract class Failure {
  final String eMessage;

  Failure(this.eMessage);
}

class ServerError extends Failure {
  ServerError(super.eMessage);

  factory ServerError.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection time out with Api');
      case DioExceptionType.sendTimeout:
        return ServerError('Send time out with Api');
      case DioExceptionType.receiveTimeout:
        return ServerError('Receive time out with Api');
      case DioExceptionType.badCertificate:
        return ServerError('Certification time out with Api');
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerError('Request is canceled');
      case DioExceptionType.connectionError:
        return ServerError('connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerError('No internet connection');
        } else {
          return ServerError('Unknown error');
        }
      default:
        return ServerError('Receive time out with Api');
    }
  }

  factory ServerError.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('Your request not found, please try later!');
    } else if (statusCode == 500) {
      return ServerError('Enteral server error, please try later!');
    } else {
      return ServerError('Oops something wrong, please try later!');
    }
  }
}
