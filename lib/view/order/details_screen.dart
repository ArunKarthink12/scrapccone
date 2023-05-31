import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/addmultiaddresscontroller.dart';
import 'package:zero_scarp/controller/multiaddresslistcontroller.dart';

import '../../controller/addtocartcontroller.dart';
import '../../controller/fill_details_controller.dart';

import '../../controller/getorder_controller.dart';
import '../../controller/materialquntity_gst_controller.dart';
import '../../controller/withgstcontroller.dart';
import '../../controller/withoutgstcontroller.dart';

class DetailsScreen extends StatefulWidget {
  // var qnty;
  // var id;

  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  WithGstController withGstController = Get.put(WithGstController());
  WithoutGstController withoutGstController = Get.put(WithoutGstController());
  MaterialQuantityController materialQuantityController =
      Get.put(MaterialQuantityController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  var selectgst = 1;
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());
  AddMultiaddressController addMultiaddressController =
      Get.put(AddMultiaddressController());
  MultiaddressController multiaddressController =
      Get.put(MultiaddressController());

  @override
  void initState() {
    fillDetailsController.getState();
    // withGstController.withGstControllerfunction(
    //     orderid: addToCartController.carlist[0].orderId.toString());
    withoutGstController.withoutGstControllerfunction(
        orderid: addToCartController.carlist[0].orderId.toString());
    multiaddressController.multiaddresscontrollerdatas().then((value) {
      multiaddressController.multiaddressdatas.first.data.isEmpty
          ? Mtdatas()
          : fulladdresspass();
    });

    super.initState();
  }

  // datas() {
  //   log("print");
  //   log(multiaddressController.multiaddressdatas.first.data[0].address);
  //   fillDetailsController.address.text =
  //       multiaddressController.multiaddressdatas.first.data[0].address;
  //   fillDetailsController.state.value =
  //       multiaddressController.multiaddressdatas.first.data[0].stateId;
  //   fillDetailsController.city.value =
  //       multiaddressController.multiaddressdatas.first.data[0].cityId;
  //   fillDetailsController.pincode.text =
  //       multiaddressController.multiaddressdatas.first.data[0].pincode;
  //   fillDetailsController.street.text =
  //       multiaddressController.multiaddressdatas.first.data[0].street;
  // }

  Mtdatas() {
    log("not print");

    fillDetailsController.address.clear();
    fillDetailsController.city.value = '';
    fillDetailsController.pincode.clear();
    fillDetailsController.state.value = '';
    fillDetailsController.street.clear();
  }

  back() {
    Get.back();
    // Get.to(ProductSelectScreen(
    //   subcategoryId: addToCartController.subid,
    //   index: addToCartController.subindex,
    //   subcategoryname: addToCartController.subtitle,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    log("cart --- >${addToCartController.carlist[0].orderId}");
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xff5EBDB7),
        appBar: AppBar(
            elevation: 10,
            backgroundColor: const Color(0xff283736),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  log("back cart --- >${addToCartController.carlist[0].orderId}");

                  addToCartController.carlist.clear();
                  withoutGstController.withoutgstorder.clear();
                  withGstController.withgstorder.clear();
                  // SharedPreferences sharedPreferences =
                  //     await SharedPreferences.getInstance();
                  // var setstring =
                  //     sharedPreferences.getString(Constants.subcataid);
                  // var subindex = sharedPreferences.getString(Constants.subindex);
                  Get.back();
                  // Get.to(ProductSelectScreen(
                  //   subcategoryId: addToCartController.subid,
                  //   index: addToCartController.subindex,
                  //   subcategoryname: addToCartController.subtitle,
                  // ));
                },
                child: Image.asset(
                  'assets/images/back.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            title: Text(
              'ENTER YOUR DETAILS',
              style: apptitle,
            )),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 100.0.wp,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  child: Column(children: [
                    // SizedBox(
                    //   height: 3.0.hp,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           selectgst = 0;
                    //         });
                    //       },
                    //       child: Material(
                    //         elevation: selectgst == 0 ? 5 : 0,
                    //         child: Container(
                    //           height: 7.0.hp,
                    //           width: 47.0.wp,
                    //           decoration: BoxDecoration(
                    //               color: selectgst == 0 ? appcolor : Colors.white,
                    //               border: Border.all(
                    //                   color: selectgst == 0
                    //                       ? appcolor
                    //                       : const Color(0xffC6C6C6))),
                    //           child: Center(
                    //               child: Text(
                    //             'With GST',
                    //             style: GoogleFonts.jost(
                    //                 textStyle: TextStyle(
                    //                     fontSize: 11.0.sp,
                    //                     color: selectgst == 0
                    //                         ? Colors.white
                    //                         : const Color(0xffA3A3A3),
                    //                     fontWeight: FontWeight.w500)),
                    //           )),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           selectgst = 1;
                    //         });
                    //       },
                    //       child: Material(
                    //         elevation: selectgst == 1 ? 5 : 0,
                    //         child: Container(
                    //           height: 7.0.hp,
                    //           width: 47.0.wp,
                    //           decoration: BoxDecoration(
                    //               color: selectgst == 1 ? appcolor : Colors.white,
                    //               border: Border.all(
                    //                 color: selectgst == 1
                    //                     ? appcolor
                    //                     : const Color(0xffC6C6C6)
                    //                         .withOpacity(0.5),
                    //               )),
                    //           child: Center(
                    //               child: Text(
                    //             'Without GST',
                    //             style: GoogleFonts.jost(
                    //                 textStyle: TextStyle(
                    //                     fontSize: 11.0.sp,
                    //                     color: selectgst == 1
                    //                         ? Colors.white
                    //                         : const Color(0xffA3A3A3),
                    //                     fontWeight: FontWeight.w500)),
                    //           )),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    selectgst == 0
                        ? Column(
                            children: [
                              //with gst
                              ProductDetailsScreen(),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Obx(() {
                                if (withoutGstController
                                    .loadingindicator.value) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (withoutGstController
                                    .withoutgstorder.isEmpty) {
                                  return Center(
                                    child: Text("No Product"),
                                  );
                                } else {
                                  return ProductDetailsWithoutGst();
                                }
                              }),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 2.5.sp),
                            child: Text(
                              'Contact info',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 13.0.sp,
                                      color: const Color(0xff263238),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FillDetails(gstvisible: selectgst),
                    const SizedBox(
                      height: 60,
                    ),
                  ])),
              SizedBox(
                width: 100.0.wp,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmallActionButton(
                            press: () {
                              Navigator.of(context).pop();
                            },
                            elevationvalue: 0,
                            text: 'CANCEL',
                            bordercolor: Colors.white,
                            bgcolor: appcolor,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    letterSpacing: 1.5,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SmallActionButton(
                            press: () async {
                              ///pass address using index

                              /////////////////////////////////////////////
                              var prizewithoutgst = withoutGstController
                                  .withoutgstorder[0].totalPrice;
                              prizewithoutgst =
                                  prizewithoutgst!.replaceAll(",", "");
                              ////////////////////////////////////////////
                              if (selectgst == 0) {
                                if (fillDetailsController.gstNumber.text !=
                                    '') {
                                  null;
                                  // await fillDetailsController
                                  //     .fillDetailsController(
                                  //   selectedgst: selectgst,
                                  //   orderId: addToCartController
                                  //       .carlist[0].orderId
                                  //       .toString(),
                                  //   gst: fillDetailsController.gstNumber.text
                                  //       .toString(),
                                  //   amount: priz,
                                  // );
                                }
                              } else {
                                if (fillDetailsController
                                    .userName.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your username");
                                } else if (fillDetailsController
                                    .companyName.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your companyName");
                                } else if (fillDetailsController
                                    .emailid.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your emailId");
                                } else if (fillDetailsController
                                    .mobileNumber.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your mobileNumber");
                                } else if (fillDetailsController
                                    .address.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your address");
                                } else if (fillDetailsController
                                    .street.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your street");
                                } else if (fillDetailsController
                                    .state.value.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your state");
                                } else if (fillDetailsController
                                    .city.value.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your city");
                                } else if (fillDetailsController
                                    .pincode.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter your pincode");
                                } else if (fillDetailsController
                                    .image.path.isEmpty) {
                                  Fluttertoast.showToast(msg: "Upload Image");
                                } else {
                                  fillDetailsController.localimageadder.value
                                      .add(fillDetailsController.image);
                                  log("types-->1${fillDetailsController.image}");
                                  log("types-->${fillDetailsController.localimageadder[0].runtimeType}");

                                  //         Future.delayed(Duration.zero, () async {
                                  //   await addMultiaddressController
                                  //       .multiaddresscontrollerdatas(
                                  //     address: fillDetailsController.address.text,
                                  //     city: fillDetailsController.city.value,
                                  //     pincode: fillDetailsController.pincode.text,
                                  //     state: fillDetailsController.state.value,
                                  //     street: fillDetailsController.street.text,
                                  //   );
                                  // }).then((value) async {
                                  //   await multiaddressController
                                  //       .multiaddresscontrollerdatas();
                                  // }).then((value) {
                                  //   fillDetailsController.address.clear();
                                  //   fillDetailsController.city.value = '';
                                  //   fillDetailsController.pincode.clear();
                                  //   fillDetailsController.state.value = '';
                                  //   fillDetailsController.street.clear();
                                  // })
                                  // await
                                  //     .then((value) {
                                  //                   Future.delayed(Duration.zero, () async {
                                  // await
                                  multiaddressController
                                          .multiaddressdatas.first.data.isEmpty
                                      ? Future.delayed(Duration.zero, () async {
                                          await fillDetailsController
                                              .fillDetailswithoutController(
                                                  pickedimage:
                                                      fillDetailsController
                                                          .image.path,
                                                  selectedgst: selectgst,
                                                  amount: prizewithoutgst,
                                                  orderId: addToCartController
                                                      .carlist[0].orderId
                                                      .toString(),
                                                  context: context);
                                        }).then((value) {
                                          addMultiaddressController
                                              .multiaddresscontrollerdatas(
                                            address: fillDetailsController
                                                .address.text,
                                            city: fillDetailsController
                                                .city.value,
                                            pincode: fillDetailsController
                                                .pincode.text,
                                            state: fillDetailsController
                                                .state.value,
                                            street: fillDetailsController
                                                .street.text,
                                          );
                                        })
                                      : Future.delayed(Duration.zero, () async {
                                          await fulladdresspass();
                                          await fillDetailsController
                                              .fillDetailswithoutController(
                                                  pickedimage:
                                                      fillDetailsController
                                                          .image.path,
                                                  selectedgst: selectgst,
                                                  amount: prizewithoutgst,
                                                  orderId: addToCartController
                                                      .carlist[0].orderId
                                                      .toString(),
                                                  context: context);
                                        });
                                }
                              }
                            },
                            elevationvalue: 0,
                            text: 'SUBMIT',
                            bordercolor: const Color(0xff283736),
                            bgcolor: const Color(0xff283736),
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    letterSpacing: 1.5,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  fulladdresspass() {
    fillDetailsController.address.text = multiaddressController
        .multiaddressdatas
        .first
        .data[fillDetailsController.selectaddressindex.value]
        .address;
    fillDetailsController.state.value = multiaddressController.multiaddressdatas
        .first.data[fillDetailsController.selectaddressindex.value].stateId;
    fillDetailsController.statename.value = multiaddressController
        .multiaddressdatas
        .first
        .data[fillDetailsController.selectaddressindex.value]
        .state;
    fillDetailsController.city.value = multiaddressController.multiaddressdatas
        .first.data[fillDetailsController.selectaddressindex.value].cityId;
    fillDetailsController.cityname.value = multiaddressController
        .multiaddressdatas
        .first
        .data[fillDetailsController.selectaddressindex.value]
        .city;
    fillDetailsController.pincode.text = multiaddressController
        .multiaddressdatas
        .first
        .data[fillDetailsController.selectaddressindex.value]
        .pincode;
    fillDetailsController.street.text = multiaddressController.multiaddressdatas
        .first.data[fillDetailsController.selectaddressindex.value].street;
  }
  // clear() {
  //   fillDetailsController.userName.text = '';
  //   fillDetailsController.address.text = '';
  //   fillDetailsController.companyName.text = '';
  //   fillDetailsController.emailid.text = '';
  //   fillDetailsController.gstNumber.text = '';
  //   fillDetailsController.mobileNumber.text = '';
  //   fillDetailsController.pincode.text = '';
  //   fillDetailsController.address.text = '';
  //   fillDetailsController.street.text = '';
  //   fillDetailsController.state.value = "";
  //   fillDetailsController.city.value = "";
  // }
}
