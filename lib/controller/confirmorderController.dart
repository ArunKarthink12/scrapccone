import '../allpackages.dart';
import '../service/confirmorderscreen.dart';

class ConfirmOrderController extends GetxController {
  // RxBool confirmorderloader = true.obs;
  // List confirmOrder = [];
  // List<CategoryModel> get getcategory => _categorymodel;
  var categoryservice = ConfirmOrderService();
  RxBool filldetailsLoad = true.obs;

  // var profilename;
  Future confirmcontroller(order_id, context) async {
    try {
      filldetailsLoad(true);
      if (filldetailsLoad.value) {
        _loadingBar(context);
      }
      var response = await categoryservice.confirmOrderSV(orderId: order_id);
      filldetailsLoad(false);
      Get.back();
      Get.to(OrderPlacedScreen());

      // if (response != null) {
      //   confirmOrder.clear();
      //   confirmOrder.add(response);
      //   Get.to(OrderPlacedScreen());
      //   confirmorderloader(false);
      // } else {
      //   confirmorderloader(false);
      // }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}
