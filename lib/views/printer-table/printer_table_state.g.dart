// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_table_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrinterTableState on _PrinterTableState, Store {
  Computed<Uint8List?>? _$screenshotBytesComputed;

  @override
  Uint8List? get screenshotBytes => (_$screenshotBytesComputed ??=
          Computed<Uint8List?>(() => super.screenshotBytes,
              name: '_PrinterTableState.screenshotBytes'))
      .value;

  late final _$_screenshotBytesAtom =
      Atom(name: '_PrinterTableState._screenshotBytes', context: context);

  @override
  Uint8List? get _screenshotBytes {
    _$_screenshotBytesAtom.reportRead();
    return super._screenshotBytes;
  }

  @override
  set _screenshotBytes(Uint8List? value) {
    _$_screenshotBytesAtom.reportWrite(value, super._screenshotBytes, () {
      super._screenshotBytes = value;
    });
  }

  late final _$_PrinterTableStateActionController =
      ActionController(name: '_PrinterTableState', context: context);

  @override
  void setScreenshotBytes(Uint8List bytes) {
    final _$actionInfo = _$_PrinterTableStateActionController.startAction(
        name: '_PrinterTableState.setScreenshotBytes');
    try {
      return super.setScreenshotBytes(bytes);
    } finally {
      _$_PrinterTableStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenshotBytes: ${screenshotBytes}
    ''';
  }
}
