import 'dart:convert';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = EdenLogger();

class EdenLogger extends Logger {
  EdenLogger()
      : super(
          printer: EdenLoggerService(
            className: 'Eden',
            isEnabled: true,
          ),
        );

  // Future<void> recordError(
  //   dynamic exception, [
  //   StackTrace? stack,
  // ]) {
  //   if (exception.toString().contains('Failed to load video')) {
  //     return Future.value();
  //   }

  //   // return FirebaseCrashlytics.instance.recordError(exception, stack);
  // }


}

class EdenLoggerService extends PrettyPrinter {
  EdenLoggerService({
    this.className,
    this.isEnabled = true,
  });

  final String? className;
  bool isEnabled;

  @override
  List<String> log(LogEvent event) {
    if (isEnabled == false ) {
      return [];
    }

    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final color = levelColors?[event.level];

    final message = stringifyMessage(event.message);

    return [
      Platform.isIOS
          ? '$emoji$message\n'
          : color != null
              ? color('$emoji$message\n')
              : '$emoji$message\n',
    ];
  }

  @override
  String stringifyMessage(dynamic message) {
    const decoder = JsonDecoder();
    const encoder = JsonEncoder.withIndent('  ');
    const color = AnsiColor.fg(15);

    if (message is String) {
      try {
        if (message.contains(':') == false ||
            message.contains('->') && (!message.contains('{')) ||
            !message.contains('"')) {
          return message;
        }
        final raw = decoder.convert(message);
        return Platform.isAndroid
            ? color(encoder.convert(raw))
            : encoder.convert(raw);
      } catch (e) {
        return message.toString();
      }
    } else if (message is Map || message is Iterable) {
      return Platform.isAndroid
          ? color(encoder.convert(message))
          : encoder.convert(message);
    } else {
      return message.toString();
    }
  }

  EdenLoggerService copyWith({
    String? className,
  }) {
    return EdenLoggerService(
      className: className ?? this.className,
    );
  }
}
