import 'dart:typed_data';

import 'package:mobx/mobx.dart';

part 'printer_table_state.g.dart';

class PrinterTableState = _PrinterTableState with _$PrinterTableState;

abstract class _PrinterTableState with Store {
  @observable
  Uint8List? _screenshotBytes;

  @computed
  Uint8List? get screenshotBytes => _screenshotBytes;

  @action
  void setScreenshotBytes(Uint8List bytes) {
    _screenshotBytes = bytes;
  }
}
