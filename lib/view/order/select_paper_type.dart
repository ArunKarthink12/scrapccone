import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../../controller/materialquntity_gst_controller.dart';
import '../../controller/subcategory_type_controller.dart';

import 'gridmaterialtype.dart';

class SelectPaperType extends StatefulWidget {
  String? id;
  SelectPaperType({Key? key, this.id}) : super(key: key);

  @override
  State<SelectPaperType> createState() => _SelectPaperTypeState();
}

class _SelectPaperTypeState extends State<SelectPaperType> {
  SubCategoryTypeController subCategorytypeController = Get.find();

  MaterialQuantityController materialQuantityController =
      Get.put(MaterialQuantityController());
  var selectedindex = 0;
  var gridIndex = 0;

  var selectGridIndex = [];
  List<TextEditingController> quanitiycotroller = <TextEditingController>[];
  // TextEditingController quanitiycotroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0;
        i <
            subCategorytypeController.getsubcategorytype[0].data!
                .materialType![selectedindex].materialSubtype!.length;
        i++) quanitiycotroller.add(TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: 1.0.hp,
              ),
              Text('Select Paper Type',
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 14.0.sp,
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600))),
              SizedBox(
                height: 2.0.hp,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: subCategorytypeController
                      .getsubcategorytype[0].data!.materialType!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = subCategorytypeController
                        .getsubcategorytype[0].data!.materialType![index];
                    if (data.materialSubtype!.isNotEmpty) {
                      selectGridIndex.add(0);
                    }
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedindex = index;

                              // log("prize---->${data.materialSubtype![2].price}");
                            });
                          },
                          child: Container(
                            height: 5.0.hp,
                            width: 90.0.wp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: selectedindex == index
                                    ? const Color(0xff455A64)
                                    : const Color(0xffC6C6C6).withOpacity(0.2),
                                border: Border.all(
                                    color: selectedindex == index
                                        ? const Color(0xff455A64)
                                        : const Color(0xffC6C6C6)
                                            .withOpacity(0.2),
                                    width: 1)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 50.0.wp,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(children: [
                                        Flexible(
                                            child: Text(
                                          data.materialName!.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 11.0.sp,
                                                  color: selectedindex == index
                                                      ? Colors.white
                                                      : const Color(0xff969696),
                                                  fontWeight: FontWeight.w500)),
                                        ))
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 30.0.wp,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                    child: Text(
                                                  '1 ${data.unit!.toString()} - Rs. ',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.0.sp,
                                                          color: selectedindex ==
                                                                  index
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xff969696),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                )),
                                                Flexible(
                                                    child: Text(
                                                  subCategorytypeController
                                                      .subCategoryList[index]
                                                      .toString(),
                                                  // subCategorytypeController
                                                  //             .fetchprize ==
                                                  //         null
                                                  //     ? subCategorytypeController
                                                  //         .getsubcategorytype[0]
                                                  //         .data!
                                                  //         .materialType![index]
                                                  //         .materialSubtype![
                                                  //             gridIndex]
                                                  //         .price
                                                  //         .toString()
                                                  //     : subCategorytypeController
                                                  //         .fetchprize
                                                  //         .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.0.sp,
                                                          color: selectedindex ==
                                                                  index
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xff969696),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ))
                                              ]),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Image.asset(
                                          selectedindex == index
                                              ? 'assets/images/up.png'
                                              : 'assets/images/down.png',
                                          height: 13,
                                          width: 13,
                                          color: selectedindex == index
                                              ? Colors.white
                                              : const Color(0xff969696),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.50.hp,
                        ),
                        selectedindex == index
                            ? Container(
                                width: 90.0.wp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffC6C6C6)
                                            .withOpacity(0.3)),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 3.0.hp,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 300,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            width: 10.0.wp,
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: subCategorytypeController
                                            .getsubcategorytype[0]
                                            .data!
                                            .materialType![selectedindex]
                                            .materialSubtype!
                                            .length,
                                        itemBuilder: ((context, index1) {
                                          var griditem =
                                              subCategorytypeController
                                                  .getsubcategorytype[0]
                                                  .data!
                                                  .materialType![selectedindex]
                                                  .materialSubtype![index1];

                                          return Column(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    ///Clear editcontroller
                                                    quanitiycotroller[
                                                            selectedindex]
                                                        .text = '';
                                                    ////Keyboard close
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();

                                                    setState(() {
                                                      gridIndex = index1;
                                                    });

                                                    selectGridIndex[
                                                            selectedindex] =
                                                        gridIndex;

                                                    ///colorCondition
                                                    subCategorytypeController
                                                            .color[
                                                        selectedindex] = index1;
                                                    ////quantity
                                                    ///
                                                    ///
                                                    log("prize...:${subCategorytypeController.color}");

                                                    ///
                                                    ////totalprize

                                                    ///
                                                    ///Actual prize
                                                    subCategorytypeController
                                                                .subCategoryList[
                                                            selectedindex] =
                                                        griditem.price;

                                                    subCategorytypeController
                                                                .selectOrderList[
                                                            selectedindex] =
                                                        ProductQuantity(
                                                            type: griditem.type,
                                                            id: griditem.id,
                                                            price: 0,
                                                            //  griditem
                                                            //     .price,
                                                            quantity: 0);

                                                    ///checking
                                                  },
                                                  child: MaterialType_GridItem(
                                                    colorCondition:
                                                        subCategorytypeController
                                                                .color[
                                                            selectedindex],
                                                    index: index,
                                                    selectedindex:
                                                        selectedindex,
                                                    data: griditem.type
                                                        .toString(),
                                                    gridIndex: gridIndex,
                                                    index1: index1,
                                                  )),

                                              ////
                                            ],
                                          );
                                        }),
                                        // gridDelegate:
                                        //     const SliverGridDelegateWithFixedCrossAxisCount(
                                        //   crossAxisCount: 3,
                                        // )
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.42,
                                              //   color: const Color(0xffEDEDED),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: Text(
                                                      'KG',
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color: const Color(
                                                                      0xff455A64)
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.50.hp,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.37,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        // Decreases_Unit(
                                                        //     gridindex:
                                                        //         gridIndex,
                                                        //     index:
                                                        //         selectedindex),
                                                        // Container(
                                                        //   height: MediaQuery.of(
                                                        //               context)
                                                        //           .size
                                                        //           .height *
                                                        //       0.05,
                                                        //   width: MediaQuery.of(
                                                        //               context)
                                                        //           .size
                                                        //           .width *
                                                        //       0.1,
                                                        //   color: const Color(
                                                        //           0xff54A39B)
                                                        //       .withOpacity(0.3),
                                                        //   padding:
                                                        //       const EdgeInsets
                                                        //               .only(
                                                        //           right: 5),
                                                        //   child: InkWell(
                                                        //       onTap: () {
                                                        //         var data = subCategorytypeController
                                                        //             .selectOrderList[
                                                        //                 selectedindex]
                                                        //             .obs;
                                                        //         var finalIndex =
                                                        //             selectGridIndex[
                                                        //                 selectedindex];
                                                        //         var griditem = subCategorytypeController
                                                        //             .getsubcategorytype[
                                                        //                 0]
                                                        //             .data!
                                                        //             .materialType![
                                                        //                 selectedindex]
                                                        //             .materialSubtype![finalIndex];
                                                        //         if (data.value
                                                        //                 .quantity !=
                                                        //             0) {
                                                        //           data.update(
                                                        //               (val) {
                                                        //             val!.quantity =
                                                        //                 (val.quantity! -
                                                        //                     1);
                                                        //             val.price = (val
                                                        //                     .price! -
                                                        //                 griditem
                                                        //                     .price!);
                                                        //             val.id =
                                                        //                 griditem
                                                        //                     .id;
                                                        //           });
                                                        //         }
                                                        //         Get.forceAppUpdate();
                                                        //       },
                                                        //       child: Icon(
                                                        //         Icons.remove,
                                                        //         size: MediaQuery.of(
                                                        //                     context)
                                                        //                 .size
                                                        //                 .height *
                                                        //             0.02,
                                                        //         color: const Color(
                                                        //             0xFF737070),
                                                        //       )),
                                                        // ),
                                                        // Container(
                                                        //     height: MediaQuery.of(
                                                        //                 context)
                                                        //             .size
                                                        //             .height *
                                                        //         0.14,
                                                        //     width: 1,
                                                        //     color: const Color(
                                                        //         0xFFEDEDED)),
                                                        //                        for (int i = 0;
                                                        //   i <
                                                        //       subCategorytypeController
                                                        //           .getsubcategorytype[0]
                                                        //           .data!
                                                        //           .materialType![
                                                        //               selectedindex]
                                                        //           .materialSubtype!
                                                        //           .length;
                                                        //   i++)
                                                        // quanitiycotroller
                                                        //     .add(TextEditingController())
                                                        // ,
                                                        Container(
                                                            height: MediaQuery
                                                                        .of(
                                                                            context)
                                                                    .size
                                                                    .height *
                                                                0.10,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.35,
                                                            color: const Color(
                                                                0xFFEDEDED),
                                                            // alignment: Alignment
                                                            //     .center,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.0
                                                                        .sp),
                                                            child:
                                                                TextFormField(
                                                              // ignore: prefer_const_constructors
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly
                                                              ],
                                                              controller:
                                                                  quanitiycotroller[
                                                                      selectedindex],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  if (quanitiycotroller[
                                                                          selectedindex]
                                                                      .text
                                                                      .isEmpty) {
                                                                    subCategorytypeController
                                                                        .selectOrderList[
                                                                            selectedindex]
                                                                        .price = 0;
                                                                    quanitiycotroller[
                                                                            selectedindex]
                                                                        .text = "0";
                                                                    subCategorytypeController
                                                                        .selectOrderList[
                                                                            selectedindex]
                                                                        .quantity = 0;
                                                                    // log(quanitiycotroller[
                                                                    //         selectedindex]
                                                                    //     .text);
                                                                  } else {
                                                                    /////////////
                                                                    ///prize////
                                                                    ////////////

                                                                    value == "0"
                                                                        ? subCategorytypeController.selectOrderList[selectedindex].quantity =
                                                                            0
                                                                        : subCategorytypeController
                                                                            .selectOrderList[selectedindex]
                                                                            .quantity = int.parse(value.toString());
                                                                    subCategorytypeController
                                                                        .selectOrderList[
                                                                            selectedindex]
                                                                        .price = int.parse(quanitiycotroller[selectedindex]
                                                                            .text
                                                                            .toString()) *
                                                                        int.parse(subCategorytypeController
                                                                            .subCategoryList[index]!
                                                                            .toString());
                                                                  }

                                                                  /////////////////
                                                                  /////quantity////
                                                                  /////////////////
                                                                  // subCategorytypeController
                                                                  //         .selectOrderList[
                                                                  //             selectedindex]
                                                                  //         .quantity =
                                                                  //     int.parse(
                                                                  //         value
                                                                  //             .toString());

                                                                  log(value);
                                                                  log(quanitiycotroller[
                                                                          selectedindex]
                                                                      .text);
                                                                  log(subCategorytypeController
                                                                      .selectOrderList[
                                                                          selectedindex]
                                                                      .price
                                                                      .toString());
                                                                  log(subCategorytypeController
                                                                      .selectOrderList[
                                                                          selectedindex]
                                                                      .quantity
                                                                      .toString());
                                                                  log(subCategorytypeController
                                                                      .subCategoryList[
                                                                          index]!
                                                                      .toString());
                                                                });
                                                              },
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.38,
                                              //   color: const Color(0xffEDEDED),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 2.0),
                                                    child: Text(
                                                      'Price',
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color: const Color(
                                                                      0xff455A64)
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.50.hp,
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff5EBDB7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                    child: Center(
                                                        child: Text(
                                                      "Rs. ${subCategorytypeController.selectOrderList[selectedindex].price.toString()}",
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              fontSize: 12.0.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.0.hp,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 3.0.hp,
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
