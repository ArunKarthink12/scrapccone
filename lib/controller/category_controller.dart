import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/category_response.dart';
import 'package:zero_scarp/service/category_service.dart';

class CategoryController extends GetxController {
  RxBool categoryLoad = true.obs;
  List<CategoryModel> getcategory = [];
  // var id;
  // var catname;
  // List<CategoryModel> get getcategory => _categorymodel;
  var categoryservice = CategoryService();
  List name = [];
  // var profilename;
  Future categoryController() async {
    categoryLoad(true);
    try {
      var response = await categoryservice.categoryService();

      if (response != null) {
        getcategory.clear();
        getcategory.add(response);
        categoryLoad(false);
      } else {
        categoryLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
