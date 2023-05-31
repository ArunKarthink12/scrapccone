// // selectaddress
// // import 'dart:developer';

// import 'package:http/http.dart' as http;

// import 'package:zero_scarp/allpackages.dart';
// // import 'package:zero_scarp/model/multiaddressmodel.dart';
// import 'package:zero_scarp/model/selectaddressmodel.dart';

// // import '../model/materialTypeiwthGst_response.dart';

// class SelectaddressListService {
//   Future selectaddresslistservicedata({order_id, address_id}) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString(Constants.authToken);
//     var data = {"order_id": order_id, "address_id": address_id};
//     try {
//       var response = await http.post(Uri.parse(Urls.selectaddress),
//           headers: {'Authorization': 'Bearer $token'});

//       var jsonresponse = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         if (jsonresponse['status'] == 'success') {
//           return SellectaddressModel.fromJson(jsonresponse);
//         } else {
//           Fluttertoast.showToast(msg: jsonresponse['message'].toString());
//         }
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
