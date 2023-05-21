import 'package:get_it/get_it.dart';

import '../stores/data_store.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

///Registra todas as [Stores] utilizadas pelo app
setupServiceLocator() {
  getIt.registerSingleton<DataStore>(DataStore());
  getIt.registerSingleton<NavigationService>(NavigationService());
}
