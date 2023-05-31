import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_scarp/allpackages.dart';

import '../model/history_Model.dart';

class HistoryService {
  Future<HistoryModel?> historydatafetch() async {
    ///sharedpreferences to store token temp
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    ///Home Screen API
    var url = Uri.parse(Urls.historyurl);

    ///token getString stored in local variable
    ///Config.Accesstoken used to take token from responce
    ///B4 that setString in login function
    var token = sharedPreferences.getString(Constants.authToken);

    ///responce by using token
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    log("service responce -->$url/$token");
    var jsondecode = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (jsondecode['status'] == 'success') {
        log('kkkkk');
        log(jsondecode['data'].toString());
        return HistoryModel.fromJson(jsondecode);
      } else {
        Fluttertoast.showToast(msg: jsondecode['message'].toString());
        return null;
      }
    } else {
      log("Error");
      return null;
    }
  }
}
