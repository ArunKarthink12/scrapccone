import 'dart:developer';

import '../allpackages.dart';
import 'package:http/http.dart' as http;

import '../model/servicemodel.dart';
import '../view/noservice.dart';
// import '../view/noservice.dart';

class ServiceModelService {
  Future<Servicemodel?> servicemodelservicefunction(
      {city, area, context}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(Urls.service);

    ///data recived by previous screen categoryId
    var referenceid = {'city': city, "area": area};

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
      // log("Service json responce-->${jonresponce}");
      // log("Service  responce-->${jonresponce['area'][0]['service']}");
      // log("Service condition responce-->${response.body}");\
      // Get.to(const Noservice());
      ///insert responce by modelclass
      return Servicemodel.fromJson(jonresponce);
    } else {
      return null;
    }
  }
}

fun(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => const AlertDialog(
      title: Text('No Service'),
      content: Text('In this Area'),
    ),
  );
}
