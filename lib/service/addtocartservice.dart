import 'dart:developer';

import 'package:zero_scarp/main.dart';

import '../allpackages.dart';
import '../model/addtocart.dart';
import 'package:http/http.dart' as http;

class AddToCartService {
  Future<AddToCartModel?> addtocartservicefunction({qnt, id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);

    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest('POST', Uri.parse(Urls.addtocart));
    request.fields.addAll({
      'type_id': id.toString(),
      'qty': qnt.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var json = jsonDecode(await response.stream.bytesToString());
      return AddToCartModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
    }

    // var headers = {'Authorization': 'Bearer$token'};
    // var headers = {'Authorization': 'Bearer $token'};
    // var request = http.MultipartRequest('POST',
    //     Uri.parse('https://propluslogics.in/zero_scrap_api/api/add_to_cart'));
    // request.fields.addAll({'type_id': id.toString(), 'qty': qnt.toString()});

    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();
    // var jsonresponse = jsonDecode(await response.stream.bytesToString());

    // if (response.statusCode == 200) {
    //   log("$jsonresponse");
    //   // print(await response.stream.bytesToString());
    //   return AddToCartModel.fromJson(jsonresponse);
    // } else {
    //   print(response.reasonPhrase);
    // }

    // var request = http.MultipartRequest('POST',
    //     Uri.parse('https://propluslogics.in/zero_scrap_api/api/add_to_cart'));
    // request.fields.addAll({'type_id': id.toString(), 'qty': qnt.toString()});
    // request.headers.addAll(headers);
    // http.StreamedResponse response = await request.send();
    // var jsonresponse = jsonDecode(await response.stream.bytesToString());
    // log("bbb->${jsonresponse.toString()}");
    // log("lalalala");
    // if (response.statusCode == 200) {
    //   log("body-->${AddToCartModel.fromJson(jsonresponse)}");
    //   if (jsonresponse['status'] == 'success') {
    //     Fluttertoast.showToast(msg: jsonresponse['message'].toString());
    //     // log(await response.stream.bytesToString());
    //     AddToCartModel.fromJson(jsonresponse);
    //     log("body-->${AddToCartModel.fromJson(jsonresponse)}");
    //     return AddToCartModel.fromJson(jsonresponse);
    //   } else {
    //     Fluttertoast.showToast(msg: jsonresponse['message'].toString());
    //   }
    // } else {
    //   print(response.reasonPhrase);
    // }
    // // var data = {
    // //   "qnt": qnt.toString(),
    // //   "id": id.toString(),
    // // };
    // // log("dataaaa-->$data");
    // // var url =
    // //     Uri.parse("https://propluslogics.in/zero_scrap_api/api/add_to_cart");
    // // var response = await http.post(url,
    // //     headers: {
    // //       'Authorization': 'Bearer $token',
    // //     },
    // //     body: data);
    // // if (response.statusCode == 200 || response.statusCode == 201) {
    // //   log("Service condition responce-->${response.body}");
    // //   var jonresponce = jsonDecode(response.body);
    // //   ///insert responce by modelclass
    // //   return AddToCartModel.fromJson(jonresponce);
    // // } else {
    // //   log("Error");
    // // }
  }
}
// }
