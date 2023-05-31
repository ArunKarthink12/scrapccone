// import 'dart:developer';

import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';
// import 'package:zero_scarp/model/getOrder.dart';

import '../../controller/fill_details_controller.dart';
import '../../controller/getorder_controller.dart';
import 'cancelOrderButton.dart';

class YourOrderList extends StatefulWidget {
  const YourOrderList({Key? key}) : super(key: key);

  @override
  State<YourOrderList> createState() => _YourOrderListState();
}

class _YourOrderListState extends State<YourOrderList> {
  var selected;
  Get_Order_Controller get_order_controller = Get.find();
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (get_order_controller.loadingindicator.value == true) {
        return const Center(child: CircularProgressIndicator());
      } else if (get_order_controller.getorderContorller.isEmpty) {
        return Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              "No Order Yet!",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ));

        // Center(child: Text("No Order Yet!"));
      } else {
        return SizedBox(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: get_order_controller
                  .getorderContorller[0].data!.orderDetails!.length,
              itemBuilder: (context, index) {
                var data = get_order_controller
                    .getorderContorller[0].data!.orderDetails;
                var count = index + 1;
                // var json = jsonEncode(data);
                return Column(children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Center(
                      child: Container(
                        width: 97.0.wp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 2, color: const Color(0xffF5F5F5)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20, // Image radius
                                    backgroundColor: const Color(0xffF6F6F6),
                                    child: Text(
                                      count.toString(),
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 9.0.sp,
                                              color: const Color(0xff333333),
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  // json![index].['materialslist'][0]['subcategory'] ,
                                                  data![index]
                                                      .materialslist![0]
                                                      .subcategory
                                                      .toString(),
                                                  style: notificationtitle,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '27/07/22',
                                                    style: notificationtime,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  selected == index
                                                      ? Image.asset(
                                                          'assets/images/up.png',
                                                          height: 10,
                                                          width: 10,
                                                          color: const Color(
                                                              0xffAAA9A9),
                                                        )
                                                      : Image.asset(
                                                          'assets/images/down.png',
                                                          height: 10,
                                                          width: 10,
                                                          color: const Color(
                                                              0xffAAA9A9),
                                                        ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: SizedBox(
                                            height: 2.0.hp,
                                            width: 50.0.wp,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: get_order_controller
                                                    .getorderContorller[0]
                                                    .data!
                                                    .orderDetails![index]
                                                    .materialslist!
                                                    .length,
                                                itemBuilder:
                                                    (context, snapshot) {
                                                  var data =
                                                      get_order_controller
                                                          .getorderContorller[0]
                                                          .data!
                                                          .orderDetails![index]
                                                          .materialslist;
                                                  return
                                                      // Row(
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment.start,
                                                      //   children: [
                                                      //     Flexible(
                                                      //       child:
                                                      SizedBox(
                                                    height: 3.0.hp,
                                                    child: Text(
                                                      "${data![snapshot].materialType},",
                                                      // '''Tamil | English, Magazine, White paper''',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          notificationsubtitle,
                                                    ),
                                                  );
                                                  // ),
                                                  //   ],
                                                  // );
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  selected == index
                      ?
                      //  Column(
                      //     children: [
                      YourOrderProductList(fetchindex: index)
                      // Container(
                      //   height: 30,
                      //   width: 30,
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           image: ExactAssetImage(
                      //               get_order_controller.localimageadder
                      //                   .toString()))),
                      // )
                      //   ],
                      // )
                      : Container(),
                ]);
              }),
        );
      }
    });
  }
}
