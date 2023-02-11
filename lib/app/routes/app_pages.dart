import 'package:get/get.dart';

import '../modules/bindings/simple_mode_binding.dart';
import '../modules/views/simple_mode_view.dart';
import '../modules/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const MainView(),
      binding: SimpleModeBinding(),
    ),
    GetPage(
      name: _Paths.SIMPLE_MODE,
      page: () => const SimpleModeView(),
      binding: SimpleModeBinding(),
    ),
  ];
}
