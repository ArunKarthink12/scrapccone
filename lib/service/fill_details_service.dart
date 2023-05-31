import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:zero_scarp/allpackages.dart';
import 'package:dio/dio.dart' as dio;

import '../controller/fill_details_controller.dart';
import '../model/fill_details_response.dart';
import '../model/filldetailscitymodel.dart';
import '../model/filldetalstatemodel.dart';
// import '../model/profileUpdate_city_response.dart';
// import '../model/profileupdate_state_response.dart';

class FillDetailsService {
  // Future fillDetailsService(
  //     {userName,
  //     mobileNumber,
  //     emailid,
  //     companyName,
  //     gstNumber,
  //     address,
  //     street,
  //     city,
  //     pincode,
  //     state,
  //     orderId,
  //     amount}) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var token = sharedPreferences.getString(Constants.authToken);
  //   try {
  //     var data = {
  //       "userName": userName ?? '',
  //       "mobileNumber": mobileNumber ?? '',
  //       "email_id": emailid ?? '',
  //       "companyName": companyName ?? '',
  //       "gstNumber": gstNumber ?? '',
  //       "address": address ?? '',
  //       "street": street ?? '',
  //       "city": city ?? '',
  //       "pincode": pincode ?? '',
  //       "state": state ?? '',
  //       "order_id": orderId ?? '',
  //       "amount": amount ?? ''
  //     };
  //     log('data-----${data.toString()}');
  //     var response = await http.post(Uri.parse(Urls.filldetails),
  //         headers: {'Authorization': 'Bearer $token'}, body: data);
  //     log('responseeeefilldata-------${response.body.toString()}');

  //     // log('jsonrespose----${jsonresponse}');
  //     var jsonresponse;
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       jsonresponse = jsonDecode(response.body);
  //       if (jsonresponse['status'] == "success") {
  //         Fluttertoast.showToast(msg: jsonresponse['message'].toString());
  //         return FillDetailsModel.fromJson(jsonresponse);
  //       } else {
  //         if (Get.isRegistered<FillDetailsController>()) {
  //           log("sdfsdf");
  //           FillDetailsController inst = Get.find();

  //           inst.isError(true);

  //           inst.errorList = (jsonresponse);
  //           // Fluttertoast.showToast(msg: inst.errorList.toString());
  //         }
  //         // Fluttertoast.showToast(msg: jsonresponse['message']);
  //         return null;
  //       }
  //       // else {
  //       //   Fluttertoast.showToast(msg: jsonresponse['message'].toString());
  //       //   // return null;
  //       // }
  //     } else {
  //       Fluttertoast.showToast(msg: jsonresponse['message'].toString());
  //       // return null;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future fillDetailswithoutService(
      {userName,
      mobileNumber,
      emailid,
      companyName,
      // gstNumber,
      address,
      street,
      city,
      pincode,
      state,
      pickedimage,
      orderId,
      amount}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    String fileNames = '';
    if (pickedimage != '') {
      log("Filename-->$fileNames");
      fileNames = pickedimage.toString().split('/').last;
    }
    try {
      dio.FormData formData;

      formData = dio.FormData.fromMap({
        // var data = {
        "userName": userName ?? '',
        "mobileNumber": mobileNumber ?? '',
        "email_id": emailid ?? '',
        "companyName": companyName ?? '',
        // "gstNumber": gstNumber ?? '',
        "address": address ?? '',
        "street": street ?? '',
        "city": city ?? '',
        "pincode": pincode ?? '',
        "state": state ?? '',
        "order_id": orderId ?? '',
        "amount": amount ?? '',
        // };
        "pickedimage": await dio.MultipartFile.fromFile(
          pickedimage,
          filename: fileNames,
          contentType: MediaType(
            "image",
            "jpg",
          ),
        )
      });

      log('data-----${formData.toString()}');
      dio.Response response = await dio.Dio().post(Urls.filldetails,
          data: formData,
          options: dio.Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));
      // var response = await http.post(Uri.parse(Urls.filldetails),
      //     headers: {'Authorization': 'Bearer $token'}, body: formData);
      // log('responseeeefilldata-------${response.body.toString()}');
      var jsonresponse;
      if (response.statusCode == 200 || response.statusCode == 201) {
        jsonresponse = response.data;

        if (jsonresponse['status'] == 'success') {
          // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return FillDetailsModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: 'Fill all the fields');

          if (Get.isRegistered<FillDetailsController>()) {
            log("sdfsdf");
            FillDetailsController inst = Get.find();

            inst.isError(true);

            inst.errorList = (jsonresponse);
            // Fluttertoast.showToast(msg: inst.errorList.toString());
          }

          return null;
        }
      } else {
        // Fluttertoast.showToast(msg: response.body.toString());
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future profileUpdteStateService() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var response = await http.post(
        Uri.parse(Urls.fillstatedetail),
        headers: {'Authorization': 'Bearer $token'},
      );

      var jsonresponse = jsonDecode(response.body);
      log("responseeeee${response.body.toString()}");

      if (response.statusCode == 200) {
        return Fillstatemodel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: response.statusCode.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future profileUpdtecityService({stateId}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var data = {"state_id": stateId};
      var response = await http.post(Uri.parse(Urls.fillcitydetail),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);
      log("decode--->$jsonresponse");

      if (response.statusCode == 200) {
        return Fillcitymodel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: response.statusCode.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
