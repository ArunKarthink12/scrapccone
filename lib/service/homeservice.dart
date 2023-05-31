import 'dart:developer';

import '../allpackages.dart';
import '../model/homescreenSeparatemodel.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<HomeModel?> homescreenService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    try {
      var response = await http.get(
        Uri.parse(Urls.homepageUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonresponse['status'] == 'success') {
          log('kkkkk');
          log(response.body);
          return HomeModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        log("Error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
