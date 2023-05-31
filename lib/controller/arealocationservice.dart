import 'package:zero_scarp/allpackages.dart';

// import '../model/arealocationmodel.dart';
// import '../model/citylocationmodel.dart';
import '../service/arealocationservice.dart';
// import '../view/livelocation/areaduplicate.dart';
import '../view/livelocation/book.dart';
// import '../service/citylocationservice.dart';

class Arealocation_Controller extends GetxController {
  RxBool areaload = true.obs;
  RxList<Arealocationmodel> arealist = <Arealocationmodel>[].obs;
  // List searchlist = [];
  RxList allBooks = [].obs;
  // List<Arealocationmodel> allBooks = <Arealocationmodel>[
  //   // Area(
  //   //   id: 1,
  //   //   area: 'test area',
  //   //   city: 'test',
  //   // ),
  //   // Area(
  //   //   id: 2,
  //   //   area: 'test area1',
  //   //   city: 'test1',
  //   // ),
  // ];
  var areaservice = ArealocationService();
  Future cityclocationController({city}) async {
    try {
      var response = await areaservice.citylocationservicefunction(city: city);

      if (response != null) {
        arealist.clear();
        arealist.add(response);
        // allBooks.add(response);
        areaload(false);
      } else {
        areaload(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
