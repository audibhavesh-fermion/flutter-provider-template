import '/core/loader/load_modules.dart';

class UiWidgets {
  static Widget getLogo(
      {required String path, required double width, required double height}) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: SvgPicture.asset(
        path,
        alignment: Alignment.center,
        width: width,
        height: height,
      ),
    );
  }

  static Widget getSvg(String path,
      {required double width, required double height}) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: SvgPicture.asset(
        path,
        alignment: Alignment.center,
        width: width,
        height: height,
      ),
    );
  }

  static Widget getIndicator(int activeIndex, int indicatorCount,
      Color activeColor, Color inactiveColor) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < indicatorCount; i++)
              if (i == activeIndex) ...[
                circleBar(true, activeColor, inactiveColor)
              ] else
                circleBar(false, activeColor, inactiveColor),
          ],
        ),
      ],
    );
  }

  static Widget circleBar(
      bool isActive, Color activeColor, Color inactiveColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  static Widget getRoundButton(BuildContext context, String text,
      {double? width,
      double? height,
      double? padding,
      double? radius,
      onPressed}) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 8.0),
      child: ElevatedButton(
          style: UIWidgetStyle.buttonStyle(Theme.of(context).primaryColor,
              Size(width ?? 50, height ?? 50), radius ?? 10),
          onPressed: onPressed ?? () {},
          child: Text(text)),
    );
  }

  static getSimpleSnakeBar(BuildContext context, String message,
      {Color? color}) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      elevation: 50,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget getPadding({int padding = 8, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }

  static showErrorMessage(
      BuildContext context, ResponseType responseType, String? message) {
    if (responseType == ResponseType.normal) {
      getMessageCardView(context, message, Colors.blueAccent);
    } else {
      getMessageCardView(context, message, Colors.red);
    }
  }

  static showAppMessages(
      BuildContext context, ResponseType responseType, String? message) {
    if (responseType == ResponseType.success) {
      getMessageCardView(context, message, Colors.green);
    } else {
      getMessageCardView(context, message, Colors.red);
    }
  }

  static getMessageCardView(
      BuildContext context, String? message, Color color) {
    final snackBar = SnackBar(
      content: Text(message ?? ErrorMessages.somethingWentWrong),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
