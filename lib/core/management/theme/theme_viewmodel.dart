import 'package:flutter_provider_template/core/management/theme/theme_manager.dart';

import '../../loader/load_modules.dart';

class ThemeViewmodel extends ChangeNotifier implements BaseViewModel {
  @override
  void clear() {}

  @override
  void reset() {
    ThemeManager.mode = ThemeMode.system;
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode) {
    ThemeManager.mode = themeMode;
    notifyListeners();
  }
}
