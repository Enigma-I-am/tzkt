import 'dart:convert';
import 'package:equatable/equatable.dart';

class RequestFailure with EquatableMixin {
  final bool status;
  final String message;
  final String? data;
  final List<String> errors;

  const RequestFailure({
    this.status = false,
    this.errors = const [],
    this.message = 'Error: Unable to complete your request',
    this.data,
  });

  static const unableToSend = RequestFailure(
    message: 'An error occurred connecting to the internet',
  );

  static const unableToProcess = RequestFailure(
    message: 'Error: Unable to process your request',
  );

  RequestFailure copyWith({
    bool? status,
    String? message,
    String? data,
    List<String>? errors,
  }) {
    return RequestFailure(
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'errors': errors,
      'message': message,
      'data': data,
    };
  }

  factory RequestFailure.fromMap(Map<String, dynamic> map) {
    return RequestFailure(
      status: map['status'] ?? false,
      message: map['message'],
      data: map['data'] is String ? map['data'] : '',
      errors: map.containsKey('errors')
          ? map['errors'] is List
              ? List<String>.from(map['errors'] ?? [])
              : [map['errors']?.toString() ?? '']
          : [],
    );
  }

  factory RequestFailure.transformError(String source) {
    final res = RequestFailure.fromMap(json.decode(source));
    final message =
        res.errors.isNotEmpty ? res.errors.first : res.data ?? res.message;
    return RequestFailure(
      message: message,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestFailure.fromJson(String source) => source.isEmpty
      ? unableToSend
      : RequestFailure.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, message, errors];
}
