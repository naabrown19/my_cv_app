import 'package:get_it/get_it.dart';
import 'package:my_cv_app/providers/nanny_data.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => MyInfoProvider());
}