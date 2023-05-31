import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

import '../model/subcategory_response.dart';

class SubCategoryService {
  Future<SubCategoryModel?> subCategoryService({categoryId}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      var token = sharedPreferences.getString(Constants.authToken);

      var data = {"categoryId": categoryId.toString()};
      log(categoryId);
      var response = await http.post(Uri.parse(Urls.getsubcategory),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonresponse['status'] == 'success') {
          // var encoded = jsonEncode(jsonresponse);
          // encoded.
          log("response-->");
          log(response.body);
          // log("responceBody-->${response.body}");

          return SubCategoryModel.fromJson(jsonresponse);
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
