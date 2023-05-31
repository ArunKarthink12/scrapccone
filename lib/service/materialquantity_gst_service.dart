import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

import '../model/materialTypeiwthGst_response.dart';

class MaterialQuantityService {
  Future materialQuantityservice({materialId, quantity}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var data = {"materialId": materialId, "quantity": quantity};
    try {
      var response = await http.post(Uri.parse(Urls.getmaterialtype),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return MaterialTypeModel.fromJson(jsonresponse);
        } else {
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
