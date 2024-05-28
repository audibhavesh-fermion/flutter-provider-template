import 'package:flutter_provider_template/core/loader/load_modules.dart';
import 'package:flutter_provider_template/core/management/theme/theme_manager.dart';
import 'package:flutter_provider_template/core/management/theme/theme_viewmodel.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => HomeViewmodel(),
        child: Scaffold(body: getThemeChooser()));
  }

  Widget getThemeChooser() {
    return Consumer<ThemeViewmodel>(builder: (context, value, child) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
              title: Text("System"),
              leading: Radio(
                value: ThemeMode.system,
                groupValue: ThemeManager.mode,
                onChanged: (ThemeMode? value) {
                  Provider.of<ThemeViewmodel>(context, listen: false)
                      .changeTheme(value ?? ThemeMode.system);
                },
              )),
          ListTile(
              title: Text("Light"),
              leading: Radio(
                value: ThemeMode.light,
                groupValue: ThemeManager.mode,
                onChanged: (ThemeMode? value) {
                  Provider.of<ThemeViewmodel>(context, listen: false)
                      .changeTheme(value ?? ThemeMode.system);
                },
              )),
          ListTile(
              title: Text("Dark"),
              leading: Radio(
                value: ThemeMode.dark,
                groupValue: ThemeManager.mode,
                onChanged: (ThemeMode? value) {
                  Provider.of<ThemeViewmodel>(context, listen: false)
                      .changeTheme(value ?? ThemeMode.system);
                },
              ))
        ],
      );
    });
  }
}
