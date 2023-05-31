import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/addtocart.dart';
import 'package:zero_scarp/service/addtocartservice.dart';

class AddToCartController extends GetxController {
  var carlist = <AddToCartModel>[];
  RxBool loadingindicator = true.obs;
  var subindex;
  var subid;
  var subtitle;
  var cartservice = AddToCartService();
  Future datafetchfromaddtocart({qnt, id}) async {
    try {
      var clint = await cartservice.addtocartservicefunction(qnt: qnt, id: id);

      if (clint != null) {
        carlist.clear();
        carlist.add(clint);
        Get.to(DetailsScreen());
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
