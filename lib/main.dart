import 'package:flutter/material.dart';

import 'consts/constants.dart';
import 'consts/routes/local_routes.dart';
import 'consts/theme/theme_app.dart';
import 'router_app.dart';
import 'services/navigation_service.dart';
import 'services/service_locator.dart';
import 'widgets/no_glow_effect.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  runApp(const TabelaFrequenciasApp());
}

class TabelaFrequenciasApp extends StatelessWidget {
  const TabelaFrequenciasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.NAME,
      theme: ThemeApp.ligthTheme,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const NoGlowEffect(),
          child: child!,
        );
      },
      initialRoute: LocalRoutes.ENTRADA_DADOS,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
