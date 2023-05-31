import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/fill_details_controller.dart';
import 'package:zero_scarp/controller/history_controller.dart';

class HistoryList extends StatefulWidget {
  HistoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  bool isyourproduct = true;
  History_Controller history_controller = Get.put(History_Controller());
  var selected;
// final Map<String, String> profile ={history_controller.historycontrollerList[0].data.t}
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: history_controller
              .historycontrollerList[0].data!.orderDetails!.length,
          itemBuilder: (context, index) {
            var count = index + 1;

            return Column(
              children: [
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
                                  radius: 20,
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
                                                history_controller
                                                    .historycontrollerList[0]
                                                    .data!
                                                    .orderDetails![index]
                                                    .materialslist![0]
                                                    .subcategory
                                                    .toString(),
                                                style: notificationtitle,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  history_controller
                                                      .historycontrollerList[0]
                                                      .data!
                                                      .orderDetails![index]
                                                      .createdAt
                                                      .toString(),
                                                  style: notificationtime,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  'assets/images/down.png',
                                                  height: 10,
                                                  width: 10,
                                                  color:
                                                      const Color(0xffAAA9A9),
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
                                          height: 2.5.hp,
                                          width: 50.0.wp,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: history_controller
                                                  .historycontrollerList[0]
                                                  .data!
                                                  .orderDetails![index]
                                                  .materialslist!
                                                  .length,
                                              itemBuilder: (context, snapshot) {
                                                return Text(
                                                  "${history_controller.historycontrollerList[0].data!.orderDetails![index].materialslist![snapshot].materialType ?? ""},",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: notificationsubtitle,
                                                );
                                              }),
                                        ),
                                      )
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
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            isyourproduct = !isyourproduct;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 5.0.hp,
                              width: 95.0.wp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xff455A64),
                                  border: Border.all(
                                      color: const Color(0xff455A64),
                                      width: 1)),
                              child: Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50.0.wp,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Row(children: [
                                            Flexible(
                                                child: Text(
                                              'Your Product',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 12.0.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ))
                                          ]),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30.0.wp,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                      isyourproduct == true
                                                          ? 'assets/images/up.png'
                                                          : 'assets/images/down.png',
                                                      height: 13,
                                                      width: 13,
                                                      color: Colors.white)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: 0.50.hp,
                            ),
                            isyourproduct == true
                                ?
                                // Column(
                                //     children: [
                                SelectedProductDetails(
                                    fetchindex: index,
                                  )

                                //   ],
                                // )
                                : Container(),
                          ],
                        ))
                    : Container(),
                const SizedBox(
                  height: 6,
                ),
              ],
            );
          }),
    );

    // });
  }
}
