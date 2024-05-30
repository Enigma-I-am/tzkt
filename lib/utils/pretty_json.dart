import 'dart:convert';

extension JsonPrettyStringExt on String {
  String get pretty => jsonPretty(this);
}

extension JsonPrettyMapExt on Map {
  String get pretty => jsonPretty(this);
}

String jsonPretty(dynamic _obj) {
  String prettyprint;

  if (_obj == null) {
    return '';
  }

  var obj = _obj;

  try {
    if (_obj is String) {
      obj = json.decode(_obj);
    }

    if (obj is Map ||
        obj is Map<dynamic, dynamic> ||
        obj is Map<String, dynamic>) {
      const encoder = JsonEncoder.withIndent('  ');
      prettyprint = encoder.convert(obj);
    } else {
      prettyprint = '$obj';
    }
  } catch (e) {
    return _obj;
  }

  return prettyprint;
}
