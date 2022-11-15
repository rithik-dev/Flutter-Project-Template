import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:project_template/utils/result.dart';

FutureOr<Result<T>> errorHandler<T>(
  FutureOr<T> Function() fn, {
  String errorText = ResultError.defaultErrorMessage,
}) async {
  try {
    final res = await fn();
    return Result.value(res);
  } on SocketException {
    return Result.errWithMsg('No internet connection!');
  } on DioError catch (e) {
    if (e.error is SocketException) {
      return Result.errWithMsg('No internet connection!');
    }
    return Result.errWithMsg(e.message);
  } catch (_) {
    return Result.errWithMsg(errorText);
  }
}
