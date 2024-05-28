enum ResponseType {
  empty,
  error,
  success,
  userNotFound,
  wrongPassword,
  somethingWentWrong,
  failed,
  retrying,
  userAlreadyExists,
  invalidUsername,
  weakPassword,
  onDataCreateError,
  onOtpSent,
  onInvalid,
  invalidOtpCode,
  userVerified,
  userIsNotVerified,
  onOTPReceived,
  cannotReadOtp,
  fileUploadFailed,
  fileUploadSuccess,
  fileUploadAborted,
  onDataReadError,
  internetNotConnected,
  normal,
}

extension ResponseTypeExtension on ResponseType {
  int get value {
    switch (this) {
      case ResponseType.empty:
        return 0;
      case ResponseType.error:
        return 1;
      case ResponseType.success:
        return 2;
      case ResponseType.userNotFound:
        return 3;
      case ResponseType.wrongPassword:
        return 4;
      case ResponseType.somethingWentWrong:
        return 5;
      case ResponseType.failed:
        return 6;
      case ResponseType.retrying:
        return 7;
      case ResponseType.userAlreadyExists:
        return 8;
      case ResponseType.invalidUsername:
        return 9;
      case ResponseType.weakPassword:
        return 10;
      case ResponseType.onDataCreateError:
        return 11;
      case ResponseType.onOtpSent:
        return 12;
      case ResponseType.onInvalid:
        return 13;
      case ResponseType.invalidOtpCode:
        return 14;
      case ResponseType.userVerified:
        return 15;
      case ResponseType.userIsNotVerified:
        return 16;
      case ResponseType.onOTPReceived:
        return 17;
      case ResponseType.cannotReadOtp:
        return 18;
      case ResponseType.fileUploadFailed:
        return 19;
      case ResponseType.fileUploadSuccess:
        return 20;
      case ResponseType.fileUploadAborted:
        return 21;
      case ResponseType.onDataReadError:
        return 22;
      case ResponseType.internetNotConnected:
        return 23;
      case ResponseType.normal:
        return 24;
    }
  }
}
