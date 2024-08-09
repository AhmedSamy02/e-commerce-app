import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message: message);
  factory ServerFailure.fromDio(DioException e) {
    logger.e('Server Failure : ${e.message ?? e.error}');
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Cannot Connect to Server');
      case DioExceptionType.unknown:
        return ServerFailure(
            'Oops! Something went wrong Please try again later');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(
            response is Map<String, dynamic> ? response['message'] : response);
      case 401:
        return ServerFailure('Request is unauthorized');
      case 403:
        return ServerFailure('Request Forbidden');
      case 404:
        return ServerFailure(
            response is Map<String, dynamic> ? response['message'] : response);
      case 500:
        return ServerFailure('Oops there\'s an internal server error');
      case 503:
        return ServerFailure('Unfortunetly Service Unavailable');
      default:
        return ServerFailure(
            'Oops! Something went wrong Please try again later');
    }
  }
}
