class SignUpErrorHandling {
  static String signUpErrorHandling(
      {required dynamic response, String key = ''}) {
    dynamic errorList = (response);

    print(errorList);

    final finalized = errorList['errors'][key] ?? '';

    return finalized == '' ? '' : finalized[0];
  }
}
