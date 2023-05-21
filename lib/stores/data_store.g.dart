// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataStore on _DataStore, Store {
  Computed<Excel?>? _$excelComputed;

  @override
  Excel? get excel => (_$excelComputed ??=
          Computed<Excel?>(() => super.excel, name: '_DataStore.excel'))
      .value;
  Computed<List<double>?>? _$numbersComputed;

  @override
  List<double>? get numbers =>
      (_$numbersComputed ??= Computed<List<double>?>(() => super.numbers,
              name: '_DataStore.numbers'))
          .value;

  late final _$_excelAtom = Atom(name: '_DataStore._excel', context: context);

  @override
  Excel? get _excel {
    _$_excelAtom.reportRead();
    return super._excel;
  }

  @override
  set _excel(Excel? value) {
    _$_excelAtom.reportWrite(value, super._excel, () {
      super._excel = value;
    });
  }

  late final _$_numbersAtom =
      Atom(name: '_DataStore._numbers', context: context);

  @override
  ObservableList<double>? get _numbers {
    _$_numbersAtom.reportRead();
    return super._numbers;
  }

  @override
  set _numbers(ObservableList<double>? value) {
    _$_numbersAtom.reportWrite(value, super._numbers, () {
      super._numbers = value;
    });
  }

  late final _$_DataStoreActionController =
      ActionController(name: '_DataStore', context: context);

  @override
  void setExcel(Excel? excel) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.setExcel');
    try {
      return super.setExcel(excel);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumbers(List<double>? numbers) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.setNumbers');
    try {
      return super.setNumbers(numbers);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
excel: ${excel},
numbers: ${numbers}
    ''';
  }
}
