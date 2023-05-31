import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';

import 'package:zero_scarp/model/fill_details_response.dart';

import 'package:zero_scarp/service/fill_details_service.dart';

import '../model/filldetailscitymodel.dart';
import '../model/filldetalstatemodel.dart';
// import '../model/profileUpdate_city_response.dart';
// import '../model/profileupdate_state_response.dart';
// import 'getorder_controller.dart';

class FillDetailsController extends GetxController {
  RxBool filldetailsLoad = true.obs;
  final List<FillDetailsModel> _filldetailsmodel = [];
  List<FillDetailsModel> get getfilldetailsmodel => _filldetailsmodel;
  var filldetailservice = FillDetailsService();
  TextEditingController userName = TextEditingController();
  RxString Uname = ''.obs;
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController emailid = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController gstNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController street = TextEditingController();
  // var selectgst = 0;
  TextEditingController pincode = TextEditingController();
  RxString state = ''.obs;
  RxString statename = ''.obs;
  RxString cityname = ''.obs;
  RxString city = ''.obs;
  RxBool isStateLoading = true.obs;
  RxBool isCityLoading = true.obs;
  final RxList<Fillstatemodel> _profileupdatestate = <Fillstatemodel>[].obs;
  RxList<Fillstatemodel> get getprofileUpdatestate => _profileupdatestate;
  final RxList<Fillcitymodel> _profileupdateCity = <Fillcitymodel>[].obs;
  RxList<Fillcitymodel> get getprofileUpdateCity => _profileupdateCity;
  var isError = false.obs;
  Map errorList = {}.obs;
  File image = File('');
  RxList localimageadder = [].obs;
  RxInt selectaddressindex = 0.obs;
  // Future fillDetailsController({
  //   gst,
  //   selectedgst,
  //   orderId,
  //   amount,
  // }) async {
  //   filldetailsLoad(true);
  //   try {
  //     log('enter--------');
  //     var response = await filldetailservice.fillDetailsService(
  //         userName: userName.text,
  //         mobileNumber: mobileNumber.text,
  //         emailid: emailid.text,
  //         companyName: companyName.text,
  //         gstNumber: gst.toString(),
  //         address: address.text,
  //         street: street.text,
  //         city: city.value,
  //         state: state.value,
  //         pincode: pincode.text,
  //         orderId: orderId,
  //         amount: amount);
  //     log('responsedata--------$response');
  //     if (response != null) {
  //       _filldetailsmodel.add(response);
  //       // Fluttertoast.showToast(msg: _filldetailsmodel[0].message.toString());
  //       filldetailsLoad(false);
  //       Get.to(ConfirmScreen(
  //         withgstamount: amount,
  //         selectedgst: selectedgst,
  //       ));
  //     } else {
  //       filldetailsLoad(false);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future fillDetailswithoutController(
      {orderId, selectedgst, pickedimage, amount, context}) async {
    try {
      filldetailsLoad(true);
      if (filldetailsLoad.value) {
        _loadingBar(context);
      }
      log('enter--------');
      var response = await filldetailservice.fillDetailswithoutService(
          userName: userName.text,
          mobileNumber: mobileNumber.text,
          emailid: emailid.text,
          companyName: companyName.text,
          // gstNumber: gstNumber.text,
          address: address.text,
          street: street.text,
          city: city.value,
          state: state.value,
          pincode: pincode.text,
          pickedimage: pickedimage,
          orderId: orderId,
          amount: amount);
      log('responsedata--------$response');
      if (response != null) {
        _filldetailsmodel.add(response);
        log('navigate');
        filldetailsLoad(false);
        Get.back();
        Get.to(ConfirmScreen(
          selectedgst: selectedgst,
          withouttgstamount: amount,
        ));

        ///add image for order and history screen

        // Fluttertoast.showToast(msg: _filldetailsmodel[0].message.toString());
        // filldetailsLoad(false);
      } else {
        filldetailsLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getState() async {
    // isStateLoading(true);
    try {
      isStateLoading(true);
      var response = await filldetailservice.profileUpdteStateService();

      log(response.toString());
      if (response != null) {
        _profileupdatestate.clear();
        // print('res---------------$response');
        _profileupdatestate.add(response);
        isStateLoading(false);
        isCityLoading(false);
      } else {
        isStateLoading(false);
        // Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getCity({stateId}) async {
    // isCityLoading(true);

    try {
      isCityLoading(true);
      var response =
          await filldetailservice.profileUpdtecityService(stateId: stateId);

      if (response != null) {
        _profileupdateCity.clear();
        _profileupdateCity.add(response);

        isCityLoading(false);
      } else {
        isCityLoading(false);
        // Get.back();
      }
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
