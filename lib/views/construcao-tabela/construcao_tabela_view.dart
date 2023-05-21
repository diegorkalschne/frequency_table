import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../consts/enums.dart';
import '../../consts/routes/local_routes.dart';
import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../stores/table_store.dart';
import '../../utils/functions_utils.dart';
import '../../widgets/appbar_action_sobre.dart';
import '../../widgets/base_background.dart';
import '../../widgets/card_result.dart';
import '../../widgets/cs_appbar.dart';
import '../../widgets/cs_checkbox.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_textfield.dart';
import '../../widgets/dialog/visualizar_dados_content.dart';
import '../../widgets/help-widgets/help_amplitude_classes.dart';
import '../../widgets/help-widgets/help_amplitude_total.dart';
import '../../widgets/help-widgets/help_coeficiente_variacao.dart';
import '../../widgets/help-widgets/help_desvio_padrao.dart';
import '../../widgets/help-widgets/help_media.dart';
import '../../widgets/help-widgets/help_mediana.dart';
import '../../widgets/help-widgets/help_moda.dart';
import '../../widgets/help-widgets/help_numero_classes.dart';
import '../../widgets/help-widgets/help_variancia.dart';
import '../../widgets/help_widget.dart';

class ConstrucaoTabelaView extends StatefulWidget {
  const ConstrucaoTabelaView({
    required this.numbers,
    super.key,
  });

  final List<double> numbers;

  @override
  State<ConstrucaoTabelaView> createState() => _ConstrucaoTabelaViewState();
}

class _ConstrucaoTabelaViewState extends State<ConstrucaoTabelaView> {
  final tableStore = TableStore();

  @override
  void initState() {
    super.initState();

    tableStore.loadData(widget.numbers);
  }

  void _visualizarEntradaDados() {
    openDialogWithContent(content: VisualizarDadosContent(numbers: widget.numbers));
  }

  DataColumn _tableHeader(String label, {Color? color}) {
    return DataColumn(
      label: Text(
        '$label',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color ?? Colors.white,
        ),
      ),
    );
  }

  DataCell _tableCell(
    String content, {
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.white,
  }) {
    return DataCell(
      Text(
        '$content',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget _webLayout() {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        //Dados
        SizedBox(
          width: 250,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    return CsCheckbox<PopulationType>(
                      value: PopulationType.populacao,
                      label: 'População',
                      onChanged: (type) {
                        tableStore.setPopulationType(type!);
                      },
                      groupValue: tableStore.populationType,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return CsCheckbox<PopulationType>(
                      value: PopulationType.amostra,
                      label: 'Amostra',
                      onChanged: (type) {
                        tableStore.setPopulationType(type!);
                      },
                      groupValue: tableStore.populationType,
                    );
                  },
                ),
                const SizedBox(height: 20),
                CsTextfield(
                  label: 'Limite Inferior',
                  controller: TextEditingController(text: tableStore.limiteInferior!.toString()),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CsTextfield(
                  label: 'Limite Superior',
                  controller: TextEditingController(text: tableStore.limiteSuperior!.toString()),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                HelpWidget(
                  onHelp: const HelpAmplitudeTotal(),
                  child: CsTextfield(
                    label: 'Amplitude Total (At)',
                    controller: TextEditingController(text: tableStore.amplitudeTotal!.toString()),
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                HelpWidget(
                  onHelp: const HelpAmplitudeClasses(),
                  child: CsTextfield(
                    label: 'Amplitude das Classes (h)',
                    controller: TextEditingController(text: tableStore.amplitudeClasses!.toString()),
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                HelpWidget(
                  onHelp: const HelpNumeroClasses(),
                  child: CsTextfield(
                    label: 'Número de Classes (k)',
                    controller: TextEditingController(text: tableStore.numeroClasses!.toString()),
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                CsTextfield(
                  label: 'Quantidade de Dados (n)',
                  controller: TextEditingController(text: tableStore.classes!.first.quantidadeNumeros.toString()),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CsElevatedButton(
                  label: 'Entrada de Dados',
                  onPressed: _visualizarEntradaDados,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 50),
        //Tabela e Resultados
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Tabela
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 0),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Observer(
                    builder: (_) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.7,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              color: Colors.blueGrey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10, top: 5),
                                    child: CsIconButton(
                                      tooltip: 'Imprimir Tabela',
                                      onPressed: () => getIt<NavigationService>().pushNamed(LocalRoutes.PRINTER_TABLE, args: tableStore),
                                      icon: const CsIcon.icon(
                                        icon: Icons.print_rounded,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  DataTable(
                                    dataRowColor: MaterialStateProperty.all(Colors.white),
                                    headingRowColor: MaterialStateProperty.all(Colors.blueGrey),
                                    columns: [
                                      _tableHeader(''),
                                      _tableHeader(''),
                                      _tableHeader('Classes'),
                                      _tableHeader(''),
                                      _tableHeader('fi'),
                                      _tableHeader('xi'),
                                      _tableHeader('fa'),
                                      _tableHeader('fa%'),
                                      _tableHeader('fr'),
                                      _tableHeader('fr%'),
                                      _tableHeader('fi * xi'),
                                      _tableHeader('xi²'),
                                      _tableHeader('fi * xi²'),
                                    ],
                                    rows: [
                                      for (int i = 0; i < tableStore.classes!.length; i++) ...[
                                        DataRow(
                                          color: MaterialStateProperty.all(
                                            tableStore.indexOfModas.contains(i)
                                                ? Colors.grey.shade800
                                                : i % 2 == 0
                                                    ? Colors.blueGrey.shade200
                                                    : Colors.blueGrey.shade300,
                                          ),
                                          cells: [
                                            _tableCell('${i + 1}', color: Colors.black),
                                            _tableCell('${tableStore.classes![i].limiteInferior}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('|---------------', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${tableStore.classes![i].limiteSuperior}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${tableStore.classes![i].frequenciaAbsoluta}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].media.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${tableStore.classes![i].frequenciaAcumulada}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].freqAcumuladaPercentual.toStringAsFixed(4))}%', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].frequenciaRelativa.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].freqRelativaPercentual.toStringAsFixed(4))}%', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].fiXi.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].xiQuadrado.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                            _tableCell('${truncateZeroDouble(tableStore.classes![i].fiXiQuadrado.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          ],
                                        ),
                                      ],
                                      //Totais
                                      DataRow(
                                        color: MaterialStateProperty.all(Colors.blueGrey),
                                        cells: [
                                          _tableCell(''),
                                          _tableCell(''),
                                          _tableCell('Total (∑)', fontWeight: FontWeight.bold),
                                          _tableCell(''),
                                          _tableCell('${valorNull(tableStore.totalFi, pattern: '')}'),
                                          _tableCell(''),
                                          _tableCell(''),
                                          _tableCell(''),
                                          _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFr?.toStringAsFixed(4)), pattern: '')}'),
                                          _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFrPercentual?.toStringAsFixed(4)), pattern: '', concat: '%')}'),
                                          _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFiXi?.toStringAsFixed(4)), pattern: '')}'),
                                          _tableCell('${valorNull(truncateZeroDouble(tableStore.totalXiQuadrado?.toStringAsFixed(4)), pattern: '')}'),
                                          _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFiXiQuadrado?.toStringAsFixed(4)), pattern: '')}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //Legenda
              _Caption(),

              const SizedBox(height: 50),

              //Resultados
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HelpWidget(
                      position: HelpPosition.top,
                      onHelp: const HelpMedia(),
                      child: CardResult(
                        label: 'Média (x̅)',
                        result: '${valorNull(truncateZeroDouble(tableStore.media?.toStringAsFixed(4)))}',
                        tooltip: 'Média',
                      ),
                    ),
                    const SizedBox(width: 15),
                    HelpWidget(
                      position: HelpPosition.top,
                      onHelp: const HelpMediana(),
                      child: CardResult(
                        label: 'Mediana (Md)',
                        result: '${valorNull(truncateZeroDouble(tableStore.mediana?.toStringAsFixed(4)))}',
                        tooltip: 'Mediana',
                      ),
                    ),
                    const SizedBox(width: 15),
                    HelpWidget(
                      position: HelpPosition.top,
                      onHelp: const HelpModa(),
                      child: CardResult(
                        label: 'Moda (Mo)',
                        result: '',
                        resultList: tableStore.moda,
                        tooltip: 'Moda',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Observer(
                      builder: (_) {
                        return HelpWidget(
                          position: HelpPosition.top,
                          onHelp: const HelpVariancia(),
                          child: CardResult(
                            label: 'Variância (${tableStore.populationType == PopulationType.populacao ? '\u03C3²' : 'S²'})',
                            result: '${valorNull(truncateZeroDouble(tableStore.variancia?.toStringAsFixed(4)))}',
                            tooltip: 'Variância',
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 15),
                    Observer(
                      builder: (_) {
                        return HelpWidget(
                          position: HelpPosition.top,
                          onHelp: const HelpDesvioPadrao(),
                          child: CardResult(
                            label: 'Desvio Padrão (${tableStore.populationType == PopulationType.populacao ? '\u03C3' : 'S'})',
                            result: '${valorNull(truncateZeroDouble(tableStore.desvioPadrao?.toStringAsFixed(4)))}',
                            tooltip: 'Desvio Padrão',
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 15),
                    Observer(
                      builder: (_) {
                        return HelpWidget(
                          position: HelpPosition.top,
                          onHelp: const HelpCoeficienteVariacao(),
                          child: CardResult(
                            label: 'CV',
                            result: '${valorNull(truncateZeroDouble(tableStore.coeficienteVariacao?.toStringAsFixed(4)), concat: '%')}',
                            tooltip: 'Coeficiente de Variação',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        //Tabela e Resultados
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Tabela
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 0),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Observer(
                  builder: (_) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            color: Colors.blueGrey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10, top: 5),
                                  child: CsIconButton(
                                    tooltip: 'Imprimir Tabela',
                                    onPressed: () => getIt<NavigationService>().pushNamed(LocalRoutes.PRINTER_TABLE, args: tableStore),
                                    icon: const CsIcon.icon(
                                      icon: Icons.print_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                DataTable(
                                  dataRowColor: MaterialStateProperty.all(Colors.white),
                                  headingRowColor: MaterialStateProperty.all(Colors.blueGrey),
                                  columns: [
                                    _tableHeader(''),
                                    _tableHeader(''),
                                    _tableHeader('Classes'),
                                    _tableHeader(''),
                                    _tableHeader('fi'),
                                    _tableHeader('xi'),
                                    _tableHeader('fa'),
                                    _tableHeader('fa%'),
                                    _tableHeader('fr'),
                                    _tableHeader('fr%'),
                                    _tableHeader('fi * xi'),
                                    _tableHeader('xi²'),
                                    _tableHeader('fi * xi²'),
                                  ],
                                  rows: [
                                    for (int i = 0; i < tableStore.classes!.length; i++) ...[
                                      DataRow(
                                        color: MaterialStateProperty.all(
                                          tableStore.indexOfModas.contains(i)
                                              ? Colors.grey.shade800
                                              : i % 2 == 0
                                                  ? Colors.blueGrey.shade200
                                                  : Colors.blueGrey.shade300,
                                        ),
                                        cells: [
                                          _tableCell('${i + 1}', color: Colors.black),
                                          _tableCell('${tableStore.classes![i].limiteInferior}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('|---------------', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${tableStore.classes![i].limiteSuperior}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${tableStore.classes![i].frequenciaAbsoluta}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].media.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${tableStore.classes![i].frequenciaAcumulada}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].freqAcumuladaPercentual.toStringAsFixed(4))}%', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].frequenciaRelativa.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].freqRelativaPercentual.toStringAsFixed(4))}%', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].fiXi.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].xiQuadrado.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].fiXiQuadrado.toStringAsFixed(4))}', color: i == tableStore.indexPosMd ? theme.colorScheme.primary : Colors.white),
                                        ],
                                      ),
                                    ],
                                    //Totais
                                    DataRow(
                                      color: MaterialStateProperty.all(Colors.blueGrey),
                                      cells: [
                                        _tableCell(''),
                                        _tableCell(''),
                                        _tableCell('Total (∑)', fontWeight: FontWeight.bold),
                                        _tableCell(''),
                                        _tableCell('${valorNull(tableStore.totalFi, pattern: '')}'),
                                        _tableCell(''),
                                        _tableCell(''),
                                        _tableCell(''),
                                        _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFr?.toStringAsFixed(4)), pattern: '')}'),
                                        _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFrPercentual?.toStringAsFixed(4)), pattern: '', concat: '%')}'),
                                        _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFiXi?.toStringAsFixed(4)), pattern: '')}'),
                                        _tableCell('${valorNull(truncateZeroDouble(tableStore.totalXiQuadrado?.toStringAsFixed(4)), pattern: '')}'),
                                        _tableCell('${valorNull(truncateZeroDouble(tableStore.totalFiXiQuadrado?.toStringAsFixed(4)), pattern: '')}'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            //Legenda
            _Caption(),

            const SizedBox(height: 50),

            //Resultados
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HelpWidget(
                    position: HelpPosition.top,
                    onHelp: const HelpMedia(),
                    child: CardResult(
                      label: 'Média (x̅)',
                      result: '${valorNull(truncateZeroDouble(tableStore.media?.toStringAsFixed(4)))}',
                      tooltip: 'Média',
                    ),
                  ),
                  const SizedBox(width: 15),
                  HelpWidget(
                    position: HelpPosition.top,
                    onHelp: const HelpMediana(),
                    child: CardResult(
                      label: 'Mediana (Md)',
                      result: '${valorNull(truncateZeroDouble(tableStore.mediana?.toStringAsFixed(4)))}',
                      tooltip: 'Mediana',
                    ),
                  ),
                  const SizedBox(width: 15),
                  HelpWidget(
                    position: HelpPosition.top,
                    onHelp: const HelpModa(),
                    child: CardResult(
                      label: 'Moda (Mo)',
                      result: '',
                      resultList: tableStore.moda,
                      tooltip: 'Moda',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Observer(
                    builder: (_) {
                      return HelpWidget(
                        position: HelpPosition.top,
                        onHelp: const HelpVariancia(),
                        child: CardResult(
                          label: 'Variância (${tableStore.populationType == PopulationType.populacao ? '\u03C3²' : 'S²'})',
                          result: '${valorNull(truncateZeroDouble(tableStore.variancia?.toStringAsFixed(4)))}',
                          tooltip: 'Variância',
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  Observer(
                    builder: (_) {
                      return HelpWidget(
                        position: HelpPosition.top,
                        onHelp: const HelpDesvioPadrao(),
                        child: CardResult(
                          label: 'Desvio Padrão (${tableStore.populationType == PopulationType.populacao ? '\u03C3' : 'S'})',
                          result: '${valorNull(truncateZeroDouble(tableStore.desvioPadrao?.toStringAsFixed(4)))}',
                          tooltip: 'Desvio Padrão',
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  Observer(
                    builder: (_) {
                      return HelpWidget(
                        position: HelpPosition.top,
                        onHelp: const HelpCoeficienteVariacao(),
                        child: CardResult(
                          label: 'CV',
                          result: '${valorNull(truncateZeroDouble(tableStore.coeficienteVariacao?.toStringAsFixed(4)), concat: '%')}',
                          tooltip: 'Coeficiente de Variação',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
            SizedBox(
              width: 250,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Observer(
                      builder: (_) {
                        return CsCheckbox<PopulationType>(
                          value: PopulationType.populacao,
                          label: 'População',
                          onChanged: (type) {
                            tableStore.setPopulationType(type!);
                          },
                          groupValue: tableStore.populationType,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return CsCheckbox<PopulationType>(
                          value: PopulationType.amostra,
                          label: 'Amostra',
                          onChanged: (type) {
                            tableStore.setPopulationType(type!);
                          },
                          groupValue: tableStore.populationType,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CsTextfield(
                      label: 'Limite Inferior',
                      controller: TextEditingController(text: tableStore.limiteInferior!.toString()),
                      enabled: false,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CsTextfield(
                      label: 'Limite Superior',
                      controller: TextEditingController(text: tableStore.limiteSuperior!.toString()),
                      enabled: false,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    HelpWidget(
                      onHelp: const HelpAmplitudeTotal(),
                      child: CsTextfield(
                        label: 'Amplitude Total (At)',
                        controller: TextEditingController(text: tableStore.amplitudeTotal!.toString()),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    HelpWidget(
                      onHelp: const HelpAmplitudeClasses(),
                      child: CsTextfield(
                        label: 'Amplitude das Classes (h)',
                        controller: TextEditingController(text: tableStore.amplitudeClasses!.toString()),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Observer(
                      builder: (_) {
                        return HelpWidget(
                          onHelp: const HelpNumeroClasses(),
                          child: CsTextfield(
                            label: 'Número de Classes (k)',
                            controller: TextEditingController(text: tableStore.numeroClasses!.toString()),
                            enabled: false,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CsTextfield(
                      label: 'Quantidade de Dados (n)',
                      controller: TextEditingController(text: tableStore.classes!.first.quantidadeNumeros.toString()),
                      enabled: false,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CsElevatedButton(
                      label: 'Entrada de Dados',
                      onPressed: _visualizarEntradaDados,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CsAppbar(
          title: 'Tabela de Distribuição de Frequências',
          forceHiddenLeading: true,
          actions: [AppbarActionSobre()],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Observer(
                builder: (_) {
                  if (tableStore.limiteInferior == tableStore.limiteSuperior) {
                    return _WarningLimites();
                  }

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        return _mobileLayout();
                      }

                      return _webLayout();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Caption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Classe Modal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Row(
            children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                alignment: Alignment.center,
                child: Text(
                  '10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Posição da Mediana',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WarningLimites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Os dados informados são inválidos.\nLimite superior e inferior são iguais!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
