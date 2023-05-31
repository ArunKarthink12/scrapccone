import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import 'package:zero_scarp/model/subcategory_response.dart';

import '../service/sub_category_service.dart';

class SubCategoryController extends GetxController {
  RxBool subcategoryLoad = true.obs;
  RxList<SubCategoryModel> getsubcategory = <SubCategoryModel>[].obs;
  // List<SubCategoryModel> get getsubcategory => _subCategorymodel;
  var subcategoryservice = SubCategoryService();
  var id;
  var name;
  String area = '';
  String locationarea = '';
  String localitylocationarea = '';
  String? localadministrativearea;
  Future subCategoryController({categoryId}) async {
    subcategoryLoad(true);
    try {
      var response =
          await subcategoryservice.subCategoryService(categoryId: categoryId);

      if (response != null) {
        getsubcategory.clear();
        getsubcategory.add(response);

        subcategoryLoad(false);
        // return getsubcategory;
      } else {
        subcategoryLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
