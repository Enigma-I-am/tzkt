import 'package:dartx/dartx.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tzkt/core/api/exception/request_failure.dart';

class BaseRepository {
  Left<RequestFailure, T> handleRequestFailure<T>(
    Object e, [
    StackTrace? s,
  ]) {
    if (e is RequestFailure) {
      return Left(e);
    }

    if (e is DioException) {
      if (e.response != null &&
          e.response?.data.toString().isNotNullOrEmpty == true) {
        return Left(RequestFailure.fromJson(e.response!.data));
      }
      return const Left(RequestFailure.unableToSend);
    }

    return const Left(RequestFailure.unableToProcess);
  }
}
