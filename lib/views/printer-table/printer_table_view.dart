import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

import '../../services/dialog_service.dart';
import '../../services/pdf_service.dart';
import '../../stores/table_store.dart';
import '../../utils/functions_utils.dart';
import '../../widgets/appbar_action_sobre.dart';
import '../../widgets/base_background.dart';
import '../../widgets/cs_appbar.dart';
import '../../widgets/cs_elevated_button.dart';

class PrinterTableView extends StatefulWidget {
  const PrinterTableView({
    required this.tableStore,
    super.key,
  });

  final TableStore tableStore;

  @override
  State<PrinterTableView> createState() => _PrinterTableViewState();
}

class _PrinterTableViewState extends State<PrinterTableView> {
  late final TableStore tableStore;
  final screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();

    tableStore = widget.tableStore;
  }

  void _printer() async {
    try {
      final tableBytes = await screenshotController.capture();

      Uint8List pdfBytes = await PDFSyncService(tableBytes).generatePDF();

      await Printing.layoutPdf(
        onLayout: (_) => pdfBytes,
        format: PdfPageFormat.a4,
        dynamicLayout: false,
        usePrinterSettings: true,
      );
    } catch (err) {
      showSnackbar(description: 'Erro ao imprimir documento');
    }
  }

  DataColumn _tableHeader(String label) {
    return DataColumn(
      label: Text(
        '$label',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  DataCell _tableCell(
    String content, {
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return DataCell(
      Text(
        '$content',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CsAppbar(
          title: 'Tabela de Distribuição de Frequências',
          actions: [AppbarActionSobre()],
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
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
                    borderRadius: BorderRadius.circular(4),
                    child: Observer(
                      builder: (_) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.8,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Screenshot(
                                controller: screenshotController,
                                child: DataTable(
                                  dataRowColor: MaterialStateProperty.all(Colors.white),
                                  headingRowColor: MaterialStateProperty.all(Colors.white),
                                  columns: [
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
                                        cells: [
                                          _tableCell('${tableStore.classes![i].limiteInferior}'),
                                          _tableCell('|---------------'),
                                          _tableCell('${tableStore.classes![i].limiteSuperior}'),
                                          _tableCell('${tableStore.classes![i].frequenciaAbsoluta}'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].media.toStringAsFixed(4))}'),
                                          _tableCell('${tableStore.classes![i].frequenciaAcumulada}'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].freqAcumuladaPercentual.toStringAsFixed(4))}%'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].frequenciaRelativa.toStringAsFixed(4))}'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].freqRelativaPercentual.toStringAsFixed(4))}%'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].fiXi.toStringAsFixed(4))}'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].xiQuadrado.toStringAsFixed(4))}'),
                                          _tableCell('${truncateZeroDouble(tableStore.classes![i].fiXiQuadrado.toStringAsFixed(4))}'),
                                        ],
                                      ),
                                    ],
                                    //Totais
                                    DataRow(
                                      cells: [
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                CsElevatedButton(
                  label: 'Imprimir',
                  onPressed: _printer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
