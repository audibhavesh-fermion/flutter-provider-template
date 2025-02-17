import 'package:connectivity_plus/connectivity_plus.dart';

import '/core/loader/load_modules.dart';

class NetworkHelper {
  static checkConnectivity(
      BuildContext context, Function callOnInternetConnected) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      callOnInternetConnected();
    } else if (connectivityResult == ConnectivityResult.none) {
      if (context.mounted) {
        UiWidgets.showAppMessages(context, ResponseType.internetNotConnected,
            ErrorMessages.noInternetConnection);
      }
    }
  }
}
