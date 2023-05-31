import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

import '../model/subcategory_response.dart';
import '../model/subctegory_type_response.dart';

class SubCategoryTypeService {
  static Future<SubCategoryTypeModel?> subCategoryTypeService(
      {subcategoryId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var data = {"subCategoryID": subcategoryId.toString()};
    try {
      var response = await http.post(Uri.parse(Urls.getsubcategorytype),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonresponse['status'] == 'success') {
          return SubCategoryTypeModel.fromJson(jsonresponse);
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
