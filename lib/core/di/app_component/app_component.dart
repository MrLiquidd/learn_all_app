import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_all/core/di/app_component/app_component.config.dart';


final GetIt locator = GetIt.I;

@InjectableInit(
)
Future<void> initAppComponentLocator() async {
  locator.init();
  return locator.allReady();
}
