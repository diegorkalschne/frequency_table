// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construcao_tabela_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConstrucaoTabelaState on _ConstrucaoTabelaState, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_ConstrucaoTabelaState.loading'))
      .value;

  late final _$_loadingAtom =
      Atom(name: '_ConstrucaoTabelaState._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_ConstrucaoTabelaStateActionController =
      ActionController(name: '_ConstrucaoTabelaState', context: context);

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_ConstrucaoTabelaStateActionController.startAction(
        name: '_ConstrucaoTabelaState.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_ConstrucaoTabelaStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
