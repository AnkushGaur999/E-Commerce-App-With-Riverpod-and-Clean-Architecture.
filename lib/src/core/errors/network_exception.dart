import 'dart:io';

import 'package:dio/dio.dart';

class NetworkException {
  late String message;

  NetworkException.fromException(Object exception) {
    if (exception is SocketException) {
      message = "No internet connection";
      return;
    } else if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          message = "Connection timeout with API server";
          break;
        case DioExceptionType.sendTimeout:
          message = "Send timeout with API server";
          break;
        case DioExceptionType.receiveTimeout:
          message = "Receive timeout with API server";
          break;
        case DioExceptionType.badResponse:
          message = _handleError(
            exception.response?.statusCode,
            exception.response?.data,
          );
          break;
        case DioExceptionType.cancel:
          message = "Request to API server was cancelled";
          break;
        case DioExceptionType.unknown:
          message = "Unexpected error occurred";
          break;
        default:
          message = "Something went wrong";
          break;
      }
    } else {
      message = "Something went wrong! Please try again........";
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    try {
      switch (statusCode) {
        case 400:
          return error["message"] ?? "Bad request";
        case 401:
          return error["message"] ?? "Unauthorized Access";
        case 403:
          return error["message"] ?? "Forbidden";
        case 404:
          return error["message"] ?? "Not found";
        case 502:
          return "Server Error! Please try after some time.";
        default:
          return "Something went wrong";
      }
    } catch (e) {
      return "Oops! Something went wrong\nPlease try after some time";
    }
  }
}
