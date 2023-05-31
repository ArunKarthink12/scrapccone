import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/homescreenSeparatemodel.dart';

import '../model/category_response.dart';

class CategoryService {
  Future<CategoryModel?> categoryService() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var response = await http.get(
        Uri.parse(Urls.getcategory),
        headers: {'Authorization': 'Bearer $token'},
      );

      var jsonresponse = jsonDecode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return CategoryModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      // rethrow
      log("$e");
    }
  }
}
