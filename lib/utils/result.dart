// import 'package:flutter/cupertino.dart';
//
// enum ResultType {
//   value,
//   error,
// }
//
// class Result<ValueType, ErrorType> {
//   final ValueType? _value;
//   final ErrorType? _error;
//   final ResultType type;
//
//   const Result.value(ValueType v)
//       : type = ResultType.value,
//         _value = v,
//         _error = null;
//
//   const Result.error(ErrorType e)
//       : type = ResultType.error,
//         _error = e,
//         _value = null;
//
//   ValueType get value => _value!;
//
//   ErrorType get error => _error!;
//
//   bool get isValue => type == ResultType.value;
//
//   bool get isError => type == ResultType.error;
//
//   void fold(
//       Widget Function(ValueType value) onValue,
//       Widget Function(ErrorType error) onError,
//       ) {
//     switch (type) {
//       case ResultType.value:
//         onValue(value);
//         break;
//       case ResultType.error:
//         onError(error);
//         break;
//     }
//   }
//
//   Widget builder(
//       Widget Function(ValueType value) valueBuilder,
//       Widget Function(ErrorType error) errorBuilder,
//       ) {
//     switch (type) {
//       case ResultType.value:
//         return valueBuilder(value);
//       case ResultType.error:
//         return errorBuilder(error);
//     }
//   }
//
//   @override
//   String toString() {
//     switch (type) {
//       case ResultType.value:
//         return 'Result<$ValueType>(value: $value)';
//       case ResultType.error:
//         return 'Result<$ErrorType>(error: $error)';
//     }
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:project_template/widgets/custom_snack_bar.dart';

enum ResultType {
  value,
  error,
}

class Result<ValueType> {
  final ValueType? _value;
  final ResultError? _error;
  final ResultType type;

  const Result.value(ValueType v)
      : type = ResultType.value,
        _value = v,
        _error = null;

  const Result.error(ResultError e)
      : type = ResultType.error,
        _error = e,
        _value = null;

  Result.errWithMsg(
      String msg, {
        bool showSnackBar = true,
        String? code,
        StackTrace? stackTrace,
        dynamic error,
      })  : type = ResultType.error,
        _error = ResultError(
          message: msg,
          statusCode: code,
          error: error,
          stackTrace: stackTrace,
        ),
        _value = null {
    if (showSnackBar) showErrSnackBar(msg);
  }

  ValueType get value => _value!;

  ResultError get error => _error!;

  bool get success => isValue;

  bool get isValue => type == ResultType.value;

  bool get isError => type == ResultType.error;

  void fold(
      void Function(ValueType value) onValue,
      void Function(ResultError error) onError,
      ) {
    switch (type) {
      case ResultType.value:
        onValue(value);
        break;
      case ResultType.error:
        onError(error);
        break;
    }
  }

  Widget builder(
      Widget Function(ValueType value) valueBuilder,
      Widget Function(ResultError error) errorBuilder,
      ) {
    switch (type) {
      case ResultType.value:
        return valueBuilder(value);
      case ResultType.error:
        return errorBuilder(error);
    }
  }

  @override
  String toString() {
    switch (type) {
      case ResultType.value:
        return 'Result<$ValueType>(value: $value)';
      case ResultType.error:
        return 'Result<$ResultError>(error: $error)';
    }
  }
}

class ResultError {
  final String message;
  final String? statusCode;
  final dynamic error;
  final StackTrace? stackTrace;

  static const defaultErrorMessage = 'Something went wrong!';

  ResultError({
    this.message = defaultErrorMessage,
    this.statusCode,
    this.stackTrace,
    this.error,
  });
}
