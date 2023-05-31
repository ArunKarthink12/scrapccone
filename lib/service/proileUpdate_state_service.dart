import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zero_scarp/allpackages.dart';

import '../model/profileupdate_state_response.dart';

class ProfileUpdteStateService {
  Future profileUpdteStateService() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var response = await http.post(
        Uri.parse(Urls.getprofileEditState),
        headers: {'Authorization': 'Bearer $token'},
      );

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message']);
          return ProfileUpdatStateModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future profileUpdtecityService({stateId}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var data = {"state_id": stateId};
      var response = await http.post(Uri.parse(Urls.getprofileEditState),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message']);
          return ProfileUpdatStateModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
