import 'dart:developer';

import '../allpackages.dart';
import 'package:http/http.dart' as http;

// import '../model/arealocationmodel.dart';
import '../view/livelocation/book.dart';
// import '../model/citylocationmodel.dart';

class ArealocationService {
  Future<Arealocationmodel?> citylocationservicefunction({city}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(Urls.locationarea);

    ///data recived by previous screen categoryId
    var referenceid = {'city': city};

    ///getString token in local variable
    var token = sharedPreferences.getString(Constants.authToken);

    ///Responce
    var response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: referenceid);
    log("service responce -->${response.body}");
    var jonresponce = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Fluttertoast.showToast(msg: response.body);

      log("Service condition responce-->${response.body}");

      ///insert responce by modelclass
      return Arealocationmodel.fromJson(jonresponce);
    } else {
      log("Error");
    }
  }
}
