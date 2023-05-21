import 'package:mobx/mobx.dart';

part 'entrada_dados_state.g.dart';

class EntradaDadosState = _EntradaDadosState with _$EntradaDadosState;

abstract class _EntradaDadosState with Store {
  @observable
  bool _excelSelected = true;

  @observable
  bool _numbersSelected = false;

  @computed
  bool get excelSelected => _excelSelected;

  @computed
  bool get numbersSelected => _numbersSelected;

  @action
  void setSelected() {
    _excelSelected = !_excelSelected;
    _numbersSelected = !_numbersSelected;
  }
}
