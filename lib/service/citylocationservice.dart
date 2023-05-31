import 'dart:developer';

import '../allpackages.dart';
import 'package:http/http.dart' as http;

import '../model/citylocationmodel.dart';

class CitylocationService {
  Future<Citylocationmodel?> citylocationservicefunction() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(Urls.locationcity);

    ///data recived by previous screen categoryId
    // var referenceid = {};

    ///getString token in local variable
    var token = sharedPreferences.getString(Constants.authToken);

    ///Responce
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    log("service responce -->${response.body}");
    var jonresponce = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Fluttertoast.showToast(msg: response.body);

      log("Service condition responce-->${response.body}");

      ///insert responce by modelclass
      return Citylocationmodel.fromJson(jonresponce);
    } else {
      log("Error");
    }
  }
}
