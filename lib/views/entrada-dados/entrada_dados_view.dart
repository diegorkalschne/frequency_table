import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;

import '../../consts/assets/assets_path.dart';
import '../../consts/routes/local_routes.dart';
import '../../services/dialog_service.dart';
import '../../services/excel_service.dart';
import '../../services/file_picker_service.dart';
import '../../services/file_web_service.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../stores/data_store.dart';
import '../../utils/functions_utils.dart';
import '../../widgets/appbar_action_sobre.dart';
import '../../widgets/base_background.dart';
import '../../widgets/cs_appbar.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_select_input_type.dart';
import '../../widgets/cs_textfield.dart';
import 'entrada_dados_state.dart';

class EntradaDadosView extends StatefulWidget {
  const EntradaDadosView({super.key});

  @override
  State<EntradaDadosView> createState() => _EntradaDadosViewState();
}

class _EntradaDadosViewState extends State<EntradaDadosView> {
  final dataStore = getIt<DataStore>();
  final stateView = EntradaDadosState();

  final delimiterController = TextEditingController();
  final numbersController = TextEditingController();

  void _selectFile() async {
    try {
      final inputData = await FilePickerService.filePicker();

      if (inputData != null) {
        final ext = path.extension(inputData.path!).toUpperCase();

        if (ext == '.XLSX') {
          final excel = await ExcelService.readFile(inputData.toUint8List());
          dataStore.setExcel(excel);

          if (!stateView.excelSelected) {
            stateView.setSelected();
          }
        } else if (ext == '.TXT') {
          final text = await FileWebService.readText(inputData.toUint8List());

          dataStore.setNumbers(convertNumbersList(text));

          if (!stateView.numbersSelected) {
            stateView.setSelected();
          }
        } else {
          showSnackbar(description: 'Arquivo não suportado');
        }
      }
    } catch (_) {}
  }

  void _nextPage() {
    if (dataStore.excel != null || dataStore.numbers != null) {
      List<double> numbers = [];
      if (stateView.excelSelected && dataStore.excel != null) {
        numbers = ExcelService.readNumbersFromFile(dataStore.excel!);
      } else if (stateView.numbersSelected) {
        numbers = dataStore.numbers!;
      } else {
        showSnackbar(description: 'Nenhuma fonte de dados selecionada', seconds: 7);
        return;
      }

      getIt<NavigationService>().pushNamed(LocalRoutes.CONSTRUCAO_TABELA, args: numbers);
    } else {
      showSnackbar(description: 'Nenhuma fonte de dados selecionada', seconds: 7);
    }
  }

  Widget _webLayout() {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsPath.PERSON,
          width: size.width * 0.35,
          height: size.width * 0.35,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selecione um arquivo ou informe os dados de entrada diretamente',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                CsElevatedButton(
                  label: 'Selecionar Arquivo',
                  onPressed: _selectFile,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: CsTextfield(
                        label: '',
                        hintText: 'Informe os dados de entrada (separado por vírgula ou especifique um delimitador)',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9,. ]')),
                        ],
                        controller: numbersController,
                        onChanged: (value) {
                          dataStore.setNumbers(convertNumbersList(value!, delimiterController.text));

                          if (dataStore.excel == null && !stateView.numbersSelected) {
                            stateView.setSelected();
                          }
                        },
                        maxLines: null,
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 120,
                      child: CsTextfield(
                        label: 'Delimitador',
                        hintText: ',',
                        maxLength: 1,
                        controller: delimiterController,
                        onChanged: (delimiter) {
                          dataStore.setNumbers(convertNumbersList(numbersController.text, delimiter));
                        },
                      ),
                    ),
                  ],
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      child: Row(
                        children: [
                          if (dataStore.excel != null) ...[
                            CsSelectInputType(
                              tooltip: 'Fonte de Dados: Excel',
                              selected: stateView.excelSelected,
                              onPressed: () {
                                if (dataStore.numbers != null) {
                                  stateView.setSelected();
                                }
                              },
                              child: const CsIcon.image(
                                imagePath: AssetsPath.EXCEL,
                                size: 50,
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                          if (dataStore.numbers != null) ...[
                            CsSelectInputType(
                              tooltip: 'Font de Dados: Entrada Númerica',
                              selected: stateView.numbersSelected,
                              onPressed: () {
                                if (dataStore.excel != null) {
                                  stateView.setSelected();
                                }
                              },
                              child: const CsIcon.image(
                                imagePath: AssetsPath.NUMBERS,
                                size: 50,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.1),
                CsElevatedButton(
                  label: 'Próxima Página',
                  onPressed: _nextPage,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsPath.PERSON,
            width: size.width * 0.6,
            height: size.width * 0.6,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selecione um arquivo ou informe os dados de entrada diretamente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              CsElevatedButton(
                label: 'Selecionar Arquivo',
                onPressed: _selectFile,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CsTextfield(
                      label: '',
                      hintText: 'Informe os dados de entrada (separado por vírgula ou especifique um delimitador)',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9,. ]')),
                      ],
                      controller: numbersController,
                      onChanged: (value) {
                        dataStore.setNumbers(convertNumbersList(value!, delimiterController.text));

                        if (dataStore.excel == null && !stateView.numbersSelected) {
                          stateView.setSelected();
                        }
                      },
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 120,
                    child: CsTextfield(
                      label: 'Delimitador',
                      hintText: ',',
                      maxLength: 1,
                      controller: delimiterController,
                      onChanged: (delimiter) {
                        if (delimiter!.isNotEmpty) {
                          dataStore.setNumbers(convertNumbersList(numbersController.text, delimiter));
                        }
                      },
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                    child: Row(
                      children: [
                        if (dataStore.excel != null) ...[
                          CsSelectInputType(
                            tooltip: 'Fonte de Dados: Excel',
                            selected: stateView.excelSelected,
                            onPressed: () {
                              if (dataStore.numbers != null) {
                                stateView.setSelected();
                              }
                            },
                            child: const CsIcon.image(
                              imagePath: AssetsPath.EXCEL,
                              size: 50,
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                        if (dataStore.numbers != null) ...[
                          CsSelectInputType(
                            tooltip: 'Font de Dados: Entrada Númerica',
                            selected: stateView.numbersSelected,
                            onPressed: () {
                              if (dataStore.excel != null) {
                                stateView.setSelected();
                              }
                            },
                            child: const CsIcon.image(
                              imagePath: AssetsPath.NUMBERS,
                              size: 50,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              CsElevatedButton(
                label: 'Próxima Página',
                onPressed: _nextPage,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBackground(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CsAppbar(
            title: 'Tabela de Distribuição de Frequências',
            actions: [AppbarActionSobre()],
          ),
          body: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: _mobileLayout(),
                  );
                }

                return Container(
                  margin: const EdgeInsets.all(50),
                  child: _webLayout(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
