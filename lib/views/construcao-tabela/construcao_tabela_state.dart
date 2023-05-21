import 'package:mobx/mobx.dart';

part 'construcao_tabela_state.g.dart';

class ConstrucaoTabelaState = _ConstrucaoTabelaState with _$ConstrucaoTabelaState;

abstract class _ConstrucaoTabelaState with Store {
  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @action
  void setLoading({required bool value}) {
    _loading = value;
  }
}
