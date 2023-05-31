import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zero_scarp/allpackages.dart';

class LoginService {
  Future<LoginModel?> loginService({mobile, password}) async {
    try {
      var data = {'Mobile': mobile ?? '', 'Password': password ?? ''};
      var response = await http.post(Uri.parse(Urls.login), body: data);
      var jsonresponse = json.decode(response.body);
      log(jsonresponse.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          // log('successs-------------------------------');
          // log('${jsonresponse['message']}');
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return LoginModel.fromJson(jsonresponse);
        } else {
          log('failure-------------------------------');
          log('${jsonresponse['message']}');
          Get.back();
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
