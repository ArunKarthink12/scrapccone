import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class ChangePasswordService {
  Future changePasswordService(
      {oldPassword, newPassword, confirmPassword, mobileNumber}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var data = {
        "oldPassword": oldPassword ?? '',
        "newPassword": newPassword ?? '',
        "confirmPassword": confirmPassword ?? '',
        "mobileNumber": mobileNumber ?? ''
      };
      log(data.toString());
      var response = await http.post(Uri.parse(Urls.changepassword),
          headers: {'Authorization': 'Bearer $token'}, body: data);
      log('responseeee-------${response.body.toString()}');

      var jsonresponse = jsonDecode(response.body);
      log('jsonrespose----${jsonresponse}');

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ChangePasswordModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(
              msg: jsonresponse['message']['newPassword'].toString());
          Get.back();
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
