import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getorder_controller.dart';

import 'cancelOrderButton.dart';
import 'yourprodect.dart';

class YourOrderProductList extends StatefulWidget {
  var fetchindex;
  YourOrderProductList({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<YourOrderProductList> createState() => _YourOrderProductListState();
}

class _YourOrderProductListState extends State<YourOrderProductList> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());
  bool isyourproduct = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            isyourproduct = !isyourproduct;
            // get_order_controller.orderid = get_order_controller
            //     .getorderContorller[0]
            //     .data!
            //     .orderDetails![widget.fetchindex]
            //     .orderId
            //     .toString();
            // log("OrderID--->${get_order_controller.orderid}");
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
                  border: Border.all(color: const Color(0xff455A64), width: 1)),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.0.wp,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(children: [
                            Flexible(
                                child: Text(
                              'Your Product',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 12.0.sp,
                                      color: Colors.white,
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
                                mainAxisAlignment: MainAxisAlignment.end,
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
                ? Column(
                    children: [
                      YourProduct_Details(
                        fetchindex: widget.fetchindex,
                      ),
                      SizedBox(
                          height: 31.0.hp,
                          width: MediaQuery.of(context).size.width - 20,
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(history_controller
                          //             .historycontrollerList[0]
                          //             .data!
                          //             .orderDetails![index]
                          //             .image
                          //             .toString()))
                          // ),
                          child: Image.network(
                              get_order_controller.getorderContorller[0].data!
                                  .orderDetails![widget.fetchindex].image
                                  .toString(),
                              fit: BoxFit.cover)),
                      const SizedBox(
                        height: 15,
                      ),

                      ///ordermodelcmnt
                      YourOrderDetailsSection(fetchindex: widget.fetchindex),

                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 10),
                          child: Cancel_Order_Button(
                            fetchindex: widget.fetchindex,
                          )),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
