// ignore_for_file: prefer_final_fields

import 'dart:math';

import 'package:mobx/mobx.dart';

import '../consts/enums.dart';
import '../models/class_model.dart';
import '../models/moda_model.dart';

part 'table_store.g.dart';

class TableStore = _TableStore with _$TableStore;

abstract class _TableStore with Store {
  @observable
  ObservableList<double>? _numbers;

  @observable
  ObservableList<ClassModel>? _classes;

  @observable
  PopulationType _populationType = PopulationType.populacao;

  @observable
  int? _limiteInferior;

  @observable
  int? _limiteSuperior;

  @observable
  int? _indexPosMd;

  @observable
  ObservableList<int> _indexOfModas = ObservableList();

  @observable
  ObservableList<ModaModel> _modas = ObservableList();

  @observable
  double? _mediana;

  @computed
  int? get indexPosMd => _indexPosMd;

  @computed
  PopulationType get populationType => _populationType;

  @computed
  List<int> get indexOfModas => [..._indexOfModas];

  @computed
  int? get limiteInferior => _limiteInferior;

  @computed
  int? get limiteSuperior => _limiteSuperior;

  @action
  void setPopulationType(PopulationType type) {
    _populationType = type;
  }

  @computed
  int? get amplitudeTotal {
    if (_limiteInferior == null || _limiteSuperior == null) {
      return null;
    }

    return (_limiteSuperior! - _limiteInferior!);
  }

  @computed
  int? get numeroClasses {
    if (_numbers == null) {
      return null;
    }

    if (_numbers!.length <= 25) {
      if (lastClassLimiteSuperior == _limiteSuperior) {
        return 6;
      }

      return 5;
    }

    int number = sqrt(_numbers!.length).ceil();

    if (lastClassLimiteSuperior == _limiteSuperior) {
      return number + 1;
    }

    return number;
  }

  @computed
  int? get amplitudeClasses {
    if (amplitudeTotal == null || _numbers == null) {
      return null;
    }

    return (amplitudeTotal! / sqrt(_numbers!.length)).ceil();
  }

  @computed
  List<ClassModel>? get classes => _classes;

  @computed
  int get lastClassLimiteSuperior => _classes?[classes!.length - 2].limiteSuperior ?? 0;

  @computed
  int? get totalFi => classes?.fold(0, (previousValue, e) => previousValue! + e.frequenciaAbsoluta);

  @computed
  double? get totalFr => classes?.fold(0, (previousValue, e) => previousValue! + e.frequenciaRelativa);

  @computed
  double? get totalFrPercentual => classes?.fold(0, (previousValue, e) => previousValue! + e.freqRelativaPercentual);

  @computed
  double? get totalFiXi => classes?.fold(0, (previousValue, e) => previousValue! + e.fiXi);

  @computed
  double? get totalXiQuadrado => classes?.fold(0, (previousValue, e) => previousValue! + e.xiQuadrado);

  @computed
  double? get totalFiXiQuadrado => classes?.fold(0, (previousValue, e) => previousValue! + e.fiXiQuadrado);

  @computed
  double? get media {
    if (totalFiXi == null) {
      return null;
    }

    return totalFiXi! / classes!.first.quantidadeNumeros;
  }

  @action
  void _setMediana() {
    //Verifica quantidade de números da entrada de dados
    int n = classes!.first.quantidadeNumeros % 2 == 0 ? classes!.first.quantidadeNumeros : classes!.first.quantidadeNumeros + 1;

    //Calcula a posição da mediana
    int posMd = n ~/ 2;

    //Acha a classe onde a posição da mediana está presente
    _indexPosMd = classes!.indexWhere((element) => element.frequenciaAcumulada >= posMd);

    if (_indexPosMd == -1 || _indexPosMd == null) {
      //Caso seja um valor inválido
      _indexPosMd = null;
      _mediana = null;
      return;
    }

    //Recupera a classe
    ClassModel classeMd = classes![_indexPosMd!];

    int li = classeMd.limiteInferior;
    int fi = classeMd.frequenciaAbsoluta;
    int faAnt = _indexPosMd! >= 1 ? classes![_indexPosMd! - 1].frequenciaAcumulada : 0;

    //Calcula a mediana
    _mediana = li + (((posMd - faAnt) * amplitudeClasses!) / fi);
  }

  @computed
  double? get mediana => _mediana;

  @action
  void _setModas() {
    _indexOfModas.clear();

    //Obtém a maior frequência absoluta
    List<int> frequenciasAbsolutas = classes!.map((e) => e.frequenciaAbsoluta).toList();
    int maxFreq = frequenciasAbsolutas.reduce((value, element) => max(value, element));

    //Identifica todas as classes modais (conforme FI)
    List<ClassModel> lClasses = classes!.where((e) => e.frequenciaAbsoluta == maxFreq).toList();

    for (int i = 0; i < lClasses.length; i++) {
      int indexOf = classes!.indexOf(lClasses[i]);

      if (indexOf != -1) {
        _indexOfModas.add(indexOf);

        ClassModel classe = classes![indexOf];

        //Recupera os valores necessários para o cálculo
        int li = classe.limiteInferior;
        int fi = classe.frequenciaAbsoluta;
        int fiAnt = indexOf >= 1 ? classes![indexOf - 1].frequenciaAbsoluta : 0;
        int fiPost = indexOf < classes!.length - 1 ? classes![indexOf + 1].frequenciaAbsoluta : 0;
        int d1 = fi - fiAnt;
        int d2 = fi - fiPost;
        int h = amplitudeClasses!;

        if (h == 0) {
          continue;
        }

        //Calcula a moda do intervalo
        double? lModa = li + (d1 / (d1 + d2)) * h;

        if (lModa.isNaN || lModa.isInfinite) {
          continue;
        }

        String label = '${classe.limiteInferior} |--- ${classe.limiteSuperior}';

        _modas.add(ModaModel(label, lModa));
      }
    }
  }

  @computed
  List<ModaModel> get moda => [..._modas];

  @computed
  double? get variancia {
    int n = classes!.first.quantidadeNumeros;

    if (populationType == PopulationType.amostra) {
      return ((totalFiXiQuadrado! / n) - (media! * media!)) * (n / (n - 1));
    }

    return ((totalFiXiQuadrado! / n) - (media! * media!));
  }

  @computed
  double? get desvioPadrao => sqrt(variancia!);

  @computed
  double? get coeficienteVariacao => (desvioPadrao! / media!) * 100;

  @action
  void loadData(List<double> numbers) {
    //Carrega a entrada de dados e ordena-os
    _numbers = numbers.asObservable();
    _numbers!.sort();

    //Pega o menor valor inteiro e o maior valor inteiro para limites
    _limiteInferior = _numbers!.first.truncate();
    _limiteSuperior = _numbers!.last.ceil();

    //Gera as classes, verifica as modas e a mediana
    _classes = _generateClasses().asObservable();
    _setModas();
    _setMediana();
  }

  List<ClassModel> _generateClasses() {
    List<ClassModel> classes = [];

    //Limite inferior para a primeira classe
    int limiteInferior = _limiteInferior!;

    //Variáveis de controle
    int sum = 0;
    bool checked = false;

    for (int i = 0; i < numeroClasses! + sum; i++) {
      //Soma o limite inferior com a amplitude de classes
      int limiteSuperior = limiteInferior + amplitudeClasses!;

      final classe = ClassModel(
        limiteInferior: limiteInferior,
        limiteSuperior: limiteSuperior,
        quantidadeNumeros: _numbers!.length,
      );

      //Verifica a quantidade de valores que fazem parte de cada classe (fi)
      final frequenciaAbsoluta = _numbers!.where((e) => e >= limiteInferior && e < limiteSuperior).toList().length;

      //Calcula a frequência acumulada com base nas classes anteriores
      final int frequenciaAcumulada;
      if (i == 0) {
        frequenciaAcumulada = frequenciaAbsoluta;
      } else {
        frequenciaAcumulada = classes.getRange(0, i).toList().fold(0, (previousValue, e) => previousValue + e.frequenciaAbsoluta) + frequenciaAbsoluta;
      }

      classe
        ..setFrequenciaAbsoluta(frequenciaAbsoluta)
        ..setFrequenciaAcumulada(frequenciaAcumulada);

      //O limite inferior da próxima classe é igual ao limite superior da classe anterior
      limiteInferior = limiteSuperior;

      classes.add(classe);

      //Para casos onde há um número que é exatamente igual ao limite superior da última classe (o qual não está incluso no intervalo). Para isso, gera-se uma nova classe
      if (i == numeroClasses! - 1) {
        if (classes.last.limiteSuperior == _limiteSuperior && !checked) {
          sum = 1;
          checked = true;
        }
      }
    }

    return classes;
  }
}
