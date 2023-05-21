import 'package:excel/excel.dart';
import 'package:mobx/mobx.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  @observable
  Excel? _excel;

  @observable
  ObservableList<double>? _numbers;

  @computed
  Excel? get excel => _excel;

  @computed
  List<double>? get numbers => _numbers;

  @action
  void setExcel(Excel? excel) {
    _excel = excel;
  }

  @action
  void setNumbers(List<double>? numbers) {
    _numbers = numbers?.asObservable();
    _numbers?.sort();
  }
}
