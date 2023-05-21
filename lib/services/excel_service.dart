import 'dart:typed_data';

import 'package:excel/excel.dart';

class ExcelService {
  static Future<Excel> readFile(Uint8List bytes) async {
    final excel = Excel.decodeBytes(bytes);

    return excel;
  }

  static List<double> readNumbersFromFile(Excel excel, {bool allSheets = false}) {
    List<double> numbers = [];

    //Por padrão, lê apenas a primeira planilha presente no arquivo
    final tables = allSheets ? excel.tables.keys : [excel.tables.keys.first];

    for (var table in tables) {
      for (var row in excel.tables[table]!.rows) {
        for (var cel in row) {
          if (cel?.value != null) {
            //Verifica se o valor lida na célula é um número
            final celValue = double.tryParse('${cel?.value}');

            if (celValue != null) {
              numbers.add(celValue);
            }
          }
        }
      }
    }

    return numbers;
  }
}
