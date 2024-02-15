import 'package:dio/dio.dart';

abstract  class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: 'The request was manually cancelled by the user.');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No Internet Connection');
      case DioExceptionType.unknown:
       if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errorMessage:'No Internet Connection');
        }
        return ServerFailure(
            errorMessage: 'unknown exception, please try again');
      default:
        return ServerFailure(errorMessage: 'oops, something Went Wrong !');
    }
  }
  factory ServerFailure.fromDioResponse(int statusCode, dynamic response) {
    if (statusCode >= 300 && statusCode < 400) {
      return ServerFailure(
          errorMessage:
              'Redirection: further action needs to be taken in order to complete the request');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: 'Not found !');
    } else if (statusCode >= 500 && statusCode < 600) {
      return ServerFailure(
          errorMessage:
              'Server error - the server failed to fulfil an apparently valid request');
    } else {
      return ServerFailure(errorMessage: 'oops, something Went Wrong !');
    }
  }
}
