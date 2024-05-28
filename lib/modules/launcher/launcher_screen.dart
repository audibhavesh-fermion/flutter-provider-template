import 'package:flutter_provider_template/core/loader/load_modules.dart';
import 'package:flutter_provider_template/core/management/theme/theme_viewmodel.dart';
import 'package:flutter_provider_template/core/management/theme/theme_manager.dart';
import 'package:flutter_provider_template/routes/route_provider.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeViewmodel(),
      )
    ], child: getLauncherScreen());
  }

  Widget getLauncherScreen() {
    return Consumer<ThemeViewmodel>(builder: (context, value, child) {
      return ResponsiveSizer(builder: (p0, p1, p2) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeManager.mode,
          darkTheme: ThemeManager.appThemeData[AppTheme.Dark],
          theme: ThemeManager.appThemeData[AppTheme.Light],
          routerConfig: AppRouter.graph,
        );
      });
    });
  }
}
