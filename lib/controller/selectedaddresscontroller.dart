// // SelectaddressListService
// // MultiaddressListService
// import 'dart:developer';

// import 'package:zero_scarp/allpackages.dart';
// // import 'package:zero_scarp/model/multiaddressmodel.dart';
// import 'package:zero_scarp/model/selectaddressmodel.dart';

// // import 'package:zero_scarp/service/materialquantity_gst_service.dart';
// // import 'package:zero_scarp/service/multiaddresslistservice.dart';
// import 'package:zero_scarp/service/selectaddressservice.dart';

// // import '../model/materialTypeiwthGst_response.dart';

// class SelectaddressController extends GetxController {
//   RxBool selectaddressloading = true.obs;
//   List<SellectaddressModel> selectaddressdatas = [];

//   // List<MaterialTypeModel> get getmaterialtype => _materialtype;
//   var clint = SelectaddressListService();
//   Future selectaddresscontrollerdatas({address_id, order_id}) async {
//     try {
//       selectaddressloading(true);
//       var response = await clint.selectaddresslistservicedata(
//           address_id: address_id, order_id: order_id);

//       if (response != null) {
//         selectaddressdatas.clear();
//         selectaddressdatas.add(response);

//         selectaddressloading(false);
//       } else {
//         selectaddressloading(false);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
