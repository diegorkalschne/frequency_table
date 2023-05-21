// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrada_dados_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EntradaDadosState on _EntradaDadosState, Store {
  Computed<bool>? _$excelSelectedComputed;

  @override
  bool get excelSelected =>
      (_$excelSelectedComputed ??= Computed<bool>(() => super.excelSelected,
              name: '_EntradaDadosState.excelSelected'))
          .value;
  Computed<bool>? _$numbersSelectedComputed;

  @override
  bool get numbersSelected =>
      (_$numbersSelectedComputed ??= Computed<bool>(() => super.numbersSelected,
              name: '_EntradaDadosState.numbersSelected'))
          .value;

  late final _$_excelSelectedAtom =
      Atom(name: '_EntradaDadosState._excelSelected', context: context);

  @override
  bool get _excelSelected {
    _$_excelSelectedAtom.reportRead();
    return super._excelSelected;
  }

  @override
  set _excelSelected(bool value) {
    _$_excelSelectedAtom.reportWrite(value, super._excelSelected, () {
      super._excelSelected = value;
    });
  }

  late final _$_numbersSelectedAtom =
      Atom(name: '_EntradaDadosState._numbersSelected', context: context);

  @override
  bool get _numbersSelected {
    _$_numbersSelectedAtom.reportRead();
    return super._numbersSelected;
  }

  @override
  set _numbersSelected(bool value) {
    _$_numbersSelectedAtom.reportWrite(value, super._numbersSelected, () {
      super._numbersSelected = value;
    });
  }

  late final _$_EntradaDadosStateActionController =
      ActionController(name: '_EntradaDadosState', context: context);

  @override
  void setSelected() {
    final _$actionInfo = _$_EntradaDadosStateActionController.startAction(
        name: '_EntradaDadosState.setSelected');
    try {
      return super.setSelected();
    } finally {
      _$_EntradaDadosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
excelSelected: ${excelSelected},
numbersSelected: ${numbersSelected}
    ''';
  }
}
