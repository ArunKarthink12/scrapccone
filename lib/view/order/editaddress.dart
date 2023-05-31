// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/addmultiaddresscontroller.dart';
import 'package:zero_scarp/controller/deleleaddresscontroller.dart';
import 'package:zero_scarp/controller/editaddresscontroller.dart';
import 'package:zero_scarp/controller/fill_details_controller.dart';
import 'package:zero_scarp/controller/multiaddresslistcontroller.dart';

import 'delivaryaddres.dart';

class MultiUsageScreenEditUpdate extends StatefulWidget {
  String title;
  String button;
  var addressid;
  // var street;
  // var stateid;
  // var cityid;
  // var pincode;
  // var address;
  MultiUsageScreenEditUpdate({
    super.key,
    this.addressid,
    required this.button,
    required this.title,
    // this.address,
    // this.cityid,
    // this.pincode,
    // this.stateid,
    // this.street
  });

  @override
  State<MultiUsageScreenEditUpdate> createState() =>
      _MultiUsageScreenEditUpdateState();
}

class _MultiUsageScreenEditUpdateState
    extends State<MultiUsageScreenEditUpdate> {
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  AddMultiaddressController addMultiaddressController =
      Get.put(AddMultiaddressController());
  MultiaddressController multiaddressController =
      Get.put(MultiaddressController());
  DeleteaddressController deleteaddressController =
      Get.put(DeleteaddressController());
  EditaddressController editaddressController =
      Get.put(EditaddressController());
  // back() {}
  backbt() {
    // Get.to(const DeliveryAddress());
    Get.back();
  }

  @override
  void initState() {
    widget.title == "Add address"
        ? null
        : fillDetailsController.getCity(
            stateId: fillDetailsController.state.value);
  }

  @override
  Widget build(BuildContext context) {
    // Printing is working fine
    // log(
    //     // fillDetailsController.address.text +
    //     fillDetailsController.city.value + fillDetailsController.cityname.value
    //     // fillDetailsController.pincode.text +
    //     // fillDetailsController.state.value +
    //     // fillDetailsController.statename.value +
    //     // fillDetailsController.street.text
    //     );

    return WillPopScope(
      onWillPop: () {
        return backbt();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        //  const Color(0xff5EBDB7),
        appBar: AppBar(
            elevation: 10,
            backgroundColor: const Color(0xff283736),
            // centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'assets/images/back.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            title: Text(
              widget.title,
              style: apptitle,
            )),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 5.0.hp),
              Text(
                "Fill Your address Details",
                style: GoogleFonts.jost(
                    fontSize: 12.0.sp, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: const Color(0xffD9D9D9).withOpacity(0.1),
                width: 95.0.wp,
                child: TextFormField(
                  controller: fillDetailsController.address,
                  autovalidateMode: fillDetailsController.isError.isTrue
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Address Field';
                    } else if (value.isNotEmpty &&
                        fillDetailsController.isError.isTrue) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: forminputcolor,
                          fontWeight: FontWeight.w500)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: const Color(0xffC6C6C6).withOpacity(0.5),
                            width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      hintText: 'Flat no/ Building name *',
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintStyle: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: const Color(0xffD9D9D9).withOpacity(0.1),
                width: 95.0.wp,
                child: TextFormField(
                  controller: fillDetailsController.street,
                  autovalidateMode: fillDetailsController.isError.isTrue
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Street Name';
                    } else if (value.isNotEmpty &&
                        fillDetailsController.isError.isTrue) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: forminputcolor,
                          fontWeight: FontWeight.w500)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: const Color(0xffC6C6C6).withOpacity(0.5),
                            width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      hintText: 'Street Name *',
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintStyle: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 7.0.hp,
                      width: 95.0.wp,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: const Color(0xFFECE9E9),
                          width: MediaQuery.of(context).size.height * 0.001,
                        ),
                        color: const Color(0xffD9D9D9).withOpacity(0.1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: fillDetailsController.state.value.isEmpty
                              ? null
                              : fillDetailsController.state.value,
                          hint: Text('State *',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: formhintcolor,
                                      fontWeight: FontWeight.w500))),
                          onChanged: (String? newValue) async {
                            fillDetailsController.state.value = newValue ?? '';
                            fillDetailsController.city('');
                            await fillDetailsController.getCity(
                                stateId: newValue);
                            setState(() {});
                          },
                          icon: Image.asset(
                            'assets/images/down.png',
                            color: const Color(0xFF737070),
                            height: 10,
                            width: 10,
                          ),
                          items: fillDetailsController
                                  .getprofileUpdatestate.isEmpty
                              ? []
                              : fillDetailsController
                                  .getprofileUpdatestate[0].state!
                                  .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    onTap: () {
                                      fillDetailsController.statename.value =
                                          value.name.toString();
                                      setState(() {});
                                    },
                                    value: value.id.toString(),
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 0, right: 4),
                                        child: Text(value.name ?? '',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    fontSize: 10.0.sp,
                                                    color: forminputcolor,
                                                    fontWeight:
                                                        FontWeight.w500)))),
                                  );
                                }).toList(),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                if (fillDetailsController.isCityLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 7.0.hp,
                          width: 95.0.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: fillDetailsController.city.value.isEmpty
                                  ? null
                                  : fillDetailsController.city.value,
                              hint: Text('City *',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 10.0.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (String? newValue) {
                                setState(() {
                                  fillDetailsController.city.value =
                                      newValue ?? '';
                                });
                              },
                              icon: Image.asset(
                                'assets/images/down.png',
                                color: const Color(0xFF737070),
                                height: 10,
                                width: 10,
                              ),
                              items: fillDetailsController
                                      .getprofileUpdateCity.isEmpty
                                  ? []
                                  : fillDetailsController
                                      .getprofileUpdateCity[0].city!
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        onTap: () {
                                          fillDetailsController.cityname.value =
                                              value.name.toString();
                                          setState(() {});
                                        },
                                        value: value.id.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.0.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ],
                  );
                }
              }),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: const Color(0xffD9D9D9).withOpacity(0.1),
                width: 95.0.wp,
                child: TextFormField(
                  controller: fillDetailsController.pincode,
                  keyboardType: TextInputType.number,
                  autovalidateMode: fillDetailsController.isError.isTrue
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter pincode';
                    } else if (value.isNotEmpty &&
                        fillDetailsController.isError.isTrue) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: forminputcolor,
                          fontWeight: FontWeight.w500)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: const Color(0xffC6C6C6).withOpacity(0.5),
                            width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      hintText: 'Pincode *',
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintStyle: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: formhintcolor,
                              fontWeight: FontWeight.w500)),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              SizedBox(
                height: 5.0.hp,
              ),
              GestureDetector(
                onTap: () {
                  widget.title == "Add address"
                      ? Future.delayed(Duration.zero, () async {
                          await addMultiaddressController
                              .multiaddresscontrollerdatas(
                            address: fillDetailsController.address.text,
                            city: fillDetailsController.city.value,
                            pincode: fillDetailsController.pincode.text,
                            state: fillDetailsController.state.value,
                            street: fillDetailsController.street.text,
                          );
                        }).then((value) {
                          multiaddressController.multiaddresscontrollerdatas();
                        }).then((value) {
                          // Get.to(const DeliveryAddress());
                          Get.back();
                          fillDetailsController.address.clear();
                          fillDetailsController.city.value = '';
                          fillDetailsController.pincode.clear();
                          fillDetailsController.state.value = '';
                          fillDetailsController.street.clear();
                        })
                      : Future.delayed(Duration.zero, () async {
                          if (fillDetailsController.address.text.isEmpty ||
                              fillDetailsController.street.text.isEmpty ||
                              fillDetailsController.city.value.isEmpty ||
                              fillDetailsController.pincode.text.isEmpty ||
                              fillDetailsController.state.value.isEmpty) {
                            Fluttertoast.showToast(msg: "Fill All Fields");
                          } else {
                            await editaddressController
                                .editaddresscontrollerdatas(
                              address: fillDetailsController.address.text,
                              city: fillDetailsController.city.value,
                              pincode: fillDetailsController.pincode.text,
                              state: fillDetailsController.state.value,
                              street: fillDetailsController.street.text,
                              address_id: widget.addressid,
                            )
                                .then((value) {
                              fillDetailsController.getState();
                              multiaddressController
                                  .multiaddresscontrollerdatas();
                            }).then((value) {
                              Get.back();
                            });
                          }
                        });
                },
                child: Container(
                  height: 6.0.hp,
                  width: MediaQuery.of(context).size.width - 10.0.wp,
                  decoration: BoxDecoration(
                    color: const Color(0xff283736),
                    borderRadius: BorderRadius.circular(2.0.sp),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.button,
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0.hp,
              ),
              Visibility(
                visible: widget.title == "Edit address" ? true : false,
                child: GestureDetector(
                  onTap: () {
                    Future.delayed(Duration.zero, () async {
                      await deleteaddressController
                          .deleteaddresscontrollerdatas(
                              address_id: widget.addressid);
                    }).then((value) {
                      multiaddressController.multiaddresscontrollerdatas();
                      fillDetailsController.getState();

                      Get.back();
                    });
                  },
                  child: Container(
                    height: 6.0.hp,
                    width: MediaQuery.of(context).size.width - 10.0.wp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0.sp),
                        color: Colors.white,
                        border: Border.all(width: 2, color: Color(0xff283736))),
                    alignment: Alignment.center,
                    child: Text(
                      "Delete Address",
                      style: GoogleFonts.roboto(
                          color: Color(0xff283736),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
