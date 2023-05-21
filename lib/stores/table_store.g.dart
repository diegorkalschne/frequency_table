// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TableStore on _TableStore, Store {
  Computed<int?>? _$indexPosMdComputed;

  @override
  int? get indexPosMd =>
      (_$indexPosMdComputed ??= Computed<int?>(() => super.indexPosMd,
              name: '_TableStore.indexPosMd'))
          .value;
  Computed<PopulationType>? _$populationTypeComputed;

  @override
  PopulationType get populationType => (_$populationTypeComputed ??=
          Computed<PopulationType>(() => super.populationType,
              name: '_TableStore.populationType'))
      .value;
  Computed<List<int>>? _$indexOfModasComputed;

  @override
  List<int> get indexOfModas =>
      (_$indexOfModasComputed ??= Computed<List<int>>(() => super.indexOfModas,
              name: '_TableStore.indexOfModas'))
          .value;
  Computed<int?>? _$limiteInferiorComputed;

  @override
  int? get limiteInferior =>
      (_$limiteInferiorComputed ??= Computed<int?>(() => super.limiteInferior,
              name: '_TableStore.limiteInferior'))
          .value;
  Computed<int?>? _$limiteSuperiorComputed;

  @override
  int? get limiteSuperior =>
      (_$limiteSuperiorComputed ??= Computed<int?>(() => super.limiteSuperior,
              name: '_TableStore.limiteSuperior'))
          .value;
  Computed<int?>? _$amplitudeTotalComputed;

  @override
  int? get amplitudeTotal =>
      (_$amplitudeTotalComputed ??= Computed<int?>(() => super.amplitudeTotal,
              name: '_TableStore.amplitudeTotal'))
          .value;
  Computed<int?>? _$numeroClassesComputed;

  @override
  int? get numeroClasses =>
      (_$numeroClassesComputed ??= Computed<int?>(() => super.numeroClasses,
              name: '_TableStore.numeroClasses'))
          .value;
  Computed<int?>? _$amplitudeClassesComputed;

  @override
  int? get amplitudeClasses => (_$amplitudeClassesComputed ??= Computed<int?>(
          () => super.amplitudeClasses,
          name: '_TableStore.amplitudeClasses'))
      .value;
  Computed<List<ClassModel>?>? _$classesComputed;

  @override
  List<ClassModel>? get classes =>
      (_$classesComputed ??= Computed<List<ClassModel>?>(() => super.classes,
              name: '_TableStore.classes'))
          .value;
  Computed<int>? _$lastClassLimiteSuperiorComputed;

  @override
  int get lastClassLimiteSuperior => (_$lastClassLimiteSuperiorComputed ??=
          Computed<int>(() => super.lastClassLimiteSuperior,
              name: '_TableStore.lastClassLimiteSuperior'))
      .value;
  Computed<int?>? _$totalFiComputed;

  @override
  int? get totalFi => (_$totalFiComputed ??=
          Computed<int?>(() => super.totalFi, name: '_TableStore.totalFi'))
      .value;
  Computed<double?>? _$totalFrComputed;

  @override
  double? get totalFr => (_$totalFrComputed ??=
          Computed<double?>(() => super.totalFr, name: '_TableStore.totalFr'))
      .value;
  Computed<double?>? _$totalFrPercentualComputed;

  @override
  double? get totalFrPercentual => (_$totalFrPercentualComputed ??=
          Computed<double?>(() => super.totalFrPercentual,
              name: '_TableStore.totalFrPercentual'))
      .value;
  Computed<double?>? _$totalFiXiComputed;

  @override
  double? get totalFiXi =>
      (_$totalFiXiComputed ??= Computed<double?>(() => super.totalFiXi,
              name: '_TableStore.totalFiXi'))
          .value;
  Computed<double?>? _$totalXiQuadradoComputed;

  @override
  double? get totalXiQuadrado => (_$totalXiQuadradoComputed ??=
          Computed<double?>(() => super.totalXiQuadrado,
              name: '_TableStore.totalXiQuadrado'))
      .value;
  Computed<double?>? _$totalFiXiQuadradoComputed;

  @override
  double? get totalFiXiQuadrado => (_$totalFiXiQuadradoComputed ??=
          Computed<double?>(() => super.totalFiXiQuadrado,
              name: '_TableStore.totalFiXiQuadrado'))
      .value;
  Computed<double?>? _$mediaComputed;

  @override
  double? get media => (_$mediaComputed ??=
          Computed<double?>(() => super.media, name: '_TableStore.media'))
      .value;
  Computed<double?>? _$medianaComputed;

  @override
  double? get mediana => (_$medianaComputed ??=
          Computed<double?>(() => super.mediana, name: '_TableStore.mediana'))
      .value;
  Computed<List<ModaModel>>? _$modaComputed;

  @override
  List<ModaModel> get moda => (_$modaComputed ??=
          Computed<List<ModaModel>>(() => super.moda, name: '_TableStore.moda'))
      .value;
  Computed<double?>? _$varianciaComputed;

  @override
  double? get variancia =>
      (_$varianciaComputed ??= Computed<double?>(() => super.variancia,
              name: '_TableStore.variancia'))
          .value;
  Computed<double?>? _$desvioPadraoComputed;

  @override
  double? get desvioPadrao =>
      (_$desvioPadraoComputed ??= Computed<double?>(() => super.desvioPadrao,
              name: '_TableStore.desvioPadrao'))
          .value;
  Computed<double?>? _$coeficienteVariacaoComputed;

  @override
  double? get coeficienteVariacao => (_$coeficienteVariacaoComputed ??=
          Computed<double?>(() => super.coeficienteVariacao,
              name: '_TableStore.coeficienteVariacao'))
      .value;

  late final _$_numbersAtom =
      Atom(name: '_TableStore._numbers', context: context);

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

  late final _$_classesAtom =
      Atom(name: '_TableStore._classes', context: context);

  @override
  ObservableList<ClassModel>? get _classes {
    _$_classesAtom.reportRead();
    return super._classes;
  }

  @override
  set _classes(ObservableList<ClassModel>? value) {
    _$_classesAtom.reportWrite(value, super._classes, () {
      super._classes = value;
    });
  }

  late final _$_populationTypeAtom =
      Atom(name: '_TableStore._populationType', context: context);

  @override
  PopulationType get _populationType {
    _$_populationTypeAtom.reportRead();
    return super._populationType;
  }

  @override
  set _populationType(PopulationType value) {
    _$_populationTypeAtom.reportWrite(value, super._populationType, () {
      super._populationType = value;
    });
  }

  late final _$_limiteInferiorAtom =
      Atom(name: '_TableStore._limiteInferior', context: context);

  @override
  int? get _limiteInferior {
    _$_limiteInferiorAtom.reportRead();
    return super._limiteInferior;
  }

  @override
  set _limiteInferior(int? value) {
    _$_limiteInferiorAtom.reportWrite(value, super._limiteInferior, () {
      super._limiteInferior = value;
    });
  }

  late final _$_limiteSuperiorAtom =
      Atom(name: '_TableStore._limiteSuperior', context: context);

  @override
  int? get _limiteSuperior {
    _$_limiteSuperiorAtom.reportRead();
    return super._limiteSuperior;
  }

  @override
  set _limiteSuperior(int? value) {
    _$_limiteSuperiorAtom.reportWrite(value, super._limiteSuperior, () {
      super._limiteSuperior = value;
    });
  }

  late final _$_indexPosMdAtom =
      Atom(name: '_TableStore._indexPosMd', context: context);

  @override
  int? get _indexPosMd {
    _$_indexPosMdAtom.reportRead();
    return super._indexPosMd;
  }

  @override
  set _indexPosMd(int? value) {
    _$_indexPosMdAtom.reportWrite(value, super._indexPosMd, () {
      super._indexPosMd = value;
    });
  }

  late final _$_indexOfModasAtom =
      Atom(name: '_TableStore._indexOfModas', context: context);

  @override
  ObservableList<int> get _indexOfModas {
    _$_indexOfModasAtom.reportRead();
    return super._indexOfModas;
  }

  @override
  set _indexOfModas(ObservableList<int> value) {
    _$_indexOfModasAtom.reportWrite(value, super._indexOfModas, () {
      super._indexOfModas = value;
    });
  }

  late final _$_modasAtom = Atom(name: '_TableStore._modas', context: context);

  @override
  ObservableList<ModaModel> get _modas {
    _$_modasAtom.reportRead();
    return super._modas;
  }

  @override
  set _modas(ObservableList<ModaModel> value) {
    _$_modasAtom.reportWrite(value, super._modas, () {
      super._modas = value;
    });
  }

  late final _$_medianaAtom =
      Atom(name: '_TableStore._mediana', context: context);

  @override
  double? get _mediana {
    _$_medianaAtom.reportRead();
    return super._mediana;
  }

  @override
  set _mediana(double? value) {
    _$_medianaAtom.reportWrite(value, super._mediana, () {
      super._mediana = value;
    });
  }

  late final _$_TableStoreActionController =
      ActionController(name: '_TableStore', context: context);

  @override
  void setPopulationType(PopulationType type) {
    final _$actionInfo = _$_TableStoreActionController.startAction(
        name: '_TableStore.setPopulationType');
    try {
      return super.setPopulationType(type);
    } finally {
      _$_TableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setMediana() {
    final _$actionInfo = _$_TableStoreActionController.startAction(
        name: '_TableStore._setMediana');
    try {
      return super._setMediana();
    } finally {
      _$_TableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setModas() {
    final _$actionInfo = _$_TableStoreActionController.startAction(
        name: '_TableStore._setModas');
    try {
      return super._setModas();
    } finally {
      _$_TableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadData(List<double> numbers) {
    final _$actionInfo =
        _$_TableStoreActionController.startAction(name: '_TableStore.loadData');
    try {
      return super.loadData(numbers);
    } finally {
      _$_TableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPosMd: ${indexPosMd},
populationType: ${populationType},
indexOfModas: ${indexOfModas},
limiteInferior: ${limiteInferior},
limiteSuperior: ${limiteSuperior},
amplitudeTotal: ${amplitudeTotal},
numeroClasses: ${numeroClasses},
amplitudeClasses: ${amplitudeClasses},
classes: ${classes},
lastClassLimiteSuperior: ${lastClassLimiteSuperior},
totalFi: ${totalFi},
totalFr: ${totalFr},
totalFrPercentual: ${totalFrPercentual},
totalFiXi: ${totalFiXi},
totalXiQuadrado: ${totalXiQuadrado},
totalFiXiQuadrado: ${totalFiXiQuadrado},
media: ${media},
mediana: ${mediana},
moda: ${moda},
variancia: ${variancia},
desvioPadrao: ${desvioPadrao},
coeficienteVariacao: ${coeficienteVariacao}
    ''';
  }
}
