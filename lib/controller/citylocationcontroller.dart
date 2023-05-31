import 'package:zero_scarp/allpackages.dart';

import '../model/citylocationmodel.dart';
import '../service/citylocationservice.dart';

class Citylocation_Controller extends GetxController {
  RxBool cityload = true.obs;
  RxList<Citylocationmodel> citylist = <Citylocationmodel>[].obs;
  // List<CategoryModel> get getcategory => _categorymodel;
  var cityservice = CitylocationService();
  // var profilename;
  Future cityclocationController() async {
    try {
      var response = await cityservice.citylocationservicefunction();

      if (response != null) {
        citylist.clear();
        citylist.add(response);
        cityload(false);
      } else {
        cityload(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
