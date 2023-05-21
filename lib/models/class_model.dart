class ClassModel {
  ClassModel({
    required this.limiteInferior,
    required this.limiteSuperior,
    required this.quantidadeNumeros,
  }) {
    _setMedia();
  }

  late final int quantidadeNumeros;
  late final int limiteInferior;
  late final int limiteSuperior;
  late final int frequenciaAbsoluta;
  late final double media;
  late final int frequenciaAcumulada;
  late final double frequenciaRelativa;

  void setFrequenciaAbsoluta(int frequencia) {
    frequenciaAbsoluta = frequencia;
    _setFrequenciaRelativa();
  }

  void _setMedia() {
    media = (limiteSuperior + limiteInferior) / 2;
  }

  void setFrequenciaAcumulada(int frequencia) {
    frequenciaAcumulada = frequencia;
  }

  void _setFrequenciaRelativa() {
    frequenciaRelativa = frequenciaAbsoluta / quantidadeNumeros;
  }

  double get freqRelativaPercentual => frequenciaRelativa * 100;

  double get freqAcumuladaPercentual => (frequenciaAcumulada / quantidadeNumeros) * 100;

  double get fiXi => frequenciaAbsoluta * media;

  double get fiXiQuadrado => frequenciaAbsoluta * (xiQuadrado);

  double get xiQuadrado => media * media;
}
