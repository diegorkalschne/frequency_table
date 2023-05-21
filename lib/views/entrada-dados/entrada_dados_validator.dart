import 'package:excel/excel.dart';

import '../../utils/functions_utils.dart';

class EntradaDadosValidator {
  static String? inputData(String? value, Excel? excel) {
    if (excel == null && isNullOrEmpty(value)) {
      return 'Informe os dados de entrada';
    }

    return null;
  }
}
