List<double>? convertNumbersList(String data, [String? delimiter]) {
  try {
    if (isNullOrEmpty(delimiter)) {
      delimiter = ',';
    }

    List<String> sData = data.split(delimiter!);

    final result = sData.map((e) => double.parse(e.trim())).toList();

    if (result.length < 5) {
      return null;
    }

    return result;
  } catch (_) {
    return null;
  }
}

bool isNullOrEmpty(dynamic value) {
  if (value == null || (value is String && value.isEmpty)) {
    return true;
  }

  return false;
}

String? truncateZeroDouble(dynamic value) {
  if (value == null || value == "NaN") {
    return null;
  }

  double decimal = 0;

  if (value is int) {
    return value.toString();
  } else if (value is double) {
    decimal = value - value.truncate();
  } else {
    value = double.parse(value.toString());
    decimal = value - value.truncate();
  }

  if (decimal == 0) {
    return value.toStringAsFixed(0);
  }

  return value.toString();
}

String valorNull(dynamic value, {String? pattern, String concat = ''}) {
  if (value == null || (value is String && (value.trim().isEmpty || value == 'null'))) {
    return pattern ?? 'Sem informação';
  }

  return '$value$concat'.trim();
}
