import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/notification_Model.dart';

import '../model/history_Model.dart';

class Notification_Service {
  Future notificationservicedatafetch() async {
    ///sharedpreferences to store token temp

    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      var token = sharedPreferences.getString(Constants.authToken);
      var url = Uri.parse(Urls.notificationUrl);

      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      // log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = jsonDecode(response.body);

        if (json["message"] == "No Notifications Yet!") {
          Fluttertoast.showToast(msg: "No Notifications Yet!");
        } else {
          log(response.body);
          // Fluttertoast.showToast(msg: json["message"].toString());
          return notificationModelFromJson(response.body);
        }
      } else {
        log("Error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
