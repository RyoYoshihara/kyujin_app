

class ApiErrorModel {
  final String errorMessage;
  final ErrorApiStatus errorType;

  ApiErrorModel(this.errorType, this.errorMessage);

  factory ApiErrorModel.create(dynamic error) {
    if (error is Map<String, dynamic>) {
      List<dynamic> errorLists = error['data']?['codes'] ?? [];
      return ApiErrorModel(
        ErrorApiStatus.getErrorType(error['status_code']),
        ErrorHandling.errorMessage(errorLists),
      );
    }

    return ApiErrorModel(
      ErrorApiStatus.unknownError,
      'ネットワークエラーが発生しました。再度お試しください。',
    );
  }

  @override
  String toString() => errorMessage;

  /// 特定のエラー時に、共通の処理を行いtrueを返却
  Future<bool> apiErrorCommonHandling() async {
    switch (errorType) {
      case ErrorApiStatus.unAuthorized:
        return true;
      case ErrorApiStatus.notAcceptable:
        // old design
        // navigationService.pushReplacementNamed(Routes.forceUpdate);
        return true;
      case ErrorApiStatus.internalServerError:
        return false;
      default:
        return false;
    }
  }
}

enum ErrorApiStatus {
  badRequest(400),
  unAuthorized(401),
  forbidden(403),
  notFound(404),
  methodNotFound(405),
  notAcceptable(406),
  conflict(409),
  internalServerError(500),
  unknownError(null),
  ;

  final int? statusCode;

  const ErrorApiStatus(this.statusCode);

  factory ErrorApiStatus.getErrorType(int? statusCode) => ErrorApiStatus.values
      .firstWhere((element) => element.statusCode == statusCode,
      orElse: () => ErrorApiStatus.unknownError);
}

class ErrorHandling {
  static String errorMessage(List<dynamic> errorCodes) {
    return _exceptionMessage(errorCodes);
  }

  static String _exceptionMessage(errorCodes) {
    String message = '';
    for (String errorCode in errorCodes) {
      switch (errorCode) {
        case 'USERACCOUNTCONFLICTED':
          message = '入力されたIDは、既に使用されています。';
          break;
        case 'USERACCOUNTALREADYREGISTERED':
          message = 'このアカウントではIDを登録済みです\nアプリを再度開いてください';
          break;
        case 'NETWORKING':
          message = 'ネットワークエラーが発生しました。再度お試しください。';
          break;
        default:
          message = '不明なエラーが発生しました。';
          break;
      }
    }

    return message;
  }
}