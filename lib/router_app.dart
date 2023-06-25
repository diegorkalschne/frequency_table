import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'consts/routes/local_routes.dart';
import 'models/class_model.dart';
import 'stores/table_store.dart';
import 'views/construcao-tabela/construcao_tabela_view.dart';
import 'views/entrada-dados/entrada_dados_view.dart';
import 'views/histogram-graph/histogram_graph_view.dart';
import 'views/printer-table/printer_table_view.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.ENTRADA_DADOS:
        return _PageBuilder(
          child: const EntradaDadosView(),
          settings: settings,
        );

      case LocalRoutes.CONSTRUCAO_TABELA:
        final numbers = settings.arguments as List<double>;

        return _PageBuilder(
          child: ConstrucaoTabelaView(numbers: numbers),
          settings: settings,
        );

      case LocalRoutes.PRINTER_TABLE:
        final tableStore = settings.arguments as TableStore;

        return _PageBuilder(
          child: PrinterTableView(tableStore: tableStore),
          settings: settings,
        );

      case LocalRoutes.HISTOGRAM_GRAPH:
        final classes = settings.arguments as List<ClassModel>;

        return _PageBuilder(
          child: HistogramGraphView(classes: classes),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const SizedBox(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  ///Responsável pelo efeito de 'fade transition' entre as transições de telas
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secAnimation, child) {
            final fadeAnimation = CurvedAnimation(
              curve: Curves.easeInToLinear,
              reverseCurve: Curves.easeInToLinear,
              parent: animation,
            );

            final theme = Theme.of(context);

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
                ),
                FadeTransition(
                  opacity: fadeAnimation,
                  child: Observer(
                    builder: (_) {
                      return child;
                    },
                  ),
                ),
              ],
            );
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}
