import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getorder_controller.dart';
import 'package:zero_scarp/controller/notification_Controller.dart';

import '../../controller/cancelOrder_controller.dart';

class CancelOrder extends StatefulWidget {
  var fetchOrderID;
  CancelOrder({Key? key, this.fetchOrderID}) : super(key: key);

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());
  CancelOrder_Controller cancelOrder_Controller =
      Get.put(CancelOrder_Controller());
  Notification_Controller notification_controller =
      Get.put(Notification_Controller());
  var reason;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cancel Order',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 14.0.sp,
                                    color: const Color(0xff2C2929),
                                    fontWeight: FontWeight.w600))),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Image.asset(
                                'assets/images/cancel_icon.png',
                                height: 30,
                                width: 30,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('Reason for cancellation',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 13.0.sp,
                                  color: const Color(0xff2C2929),
                                  fontWeight: FontWeight.w600))),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Select Reason',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: const Color(0xff2C2929),
                                  fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xFFECE9E9),
                            width: MediaQuery.of(context).size.height * 0.001,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: reason,
                            hint: Text('Select Reason', style: formhintstyle),
                            style: forminputstyle,
                            onChanged: (String? newValue) {
                              setState(() {
                                reason = newValue!;
                              });
                            },
                            icon: Image.asset(
                              'assets/images/down.png',
                              color: const Color(0xFF737070),
                              height: 10,
                              width: 10,
                            ),
                            items: <String>[
                              'I change my mind',
                              'Changed in my delivery address',
                              'Product is not required anymore'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 4),
                                    child: Text(
                                      value,
                                      style: forminputstyle,
                                    )),
                              );
                            }).toList(),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Additional Comments',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: const Color(0xff2C2929),
                                  fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xFFECE9E9),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          get_order_controller.additionalcomment_Text = value;
                        });
                      },
                      controller: get_order_controller.additionalComment,
                      style: forminputstyle,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 1,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: formhintstyle,
                        hintText: "Additional Comments",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            color: const Color(0xff283736),
                            border: Border.all(
                              color: const Color(0xff283736),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff283736),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            textStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    letterSpacing: 1.5,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          ),
                          child: Text(
                            'NEVER MIND',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            color: appcolor,
                            border: Border.all(
                              color: appcolor,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: ElevatedButton(
                          onPressed: () {
                            // log(get_order_controller.orderid);
                            // log(reason);
                            // log(get_order_controller.additionalcomment_Text);
                            if (get_order_controller.additionalcomment_Text ==
                                null) {
                              Fluttertoast.showToast(
                                  msg: "The comment field is required");
                            } else if (reason == null) {
                              Fluttertoast.showToast(
                                  msg: "The reason field is required");
                            } else if (get_order_controller
                                        .additionalcomment_Text ==
                                    null &&
                                reason == null) {
                              Fluttertoast.showToast(
                                  msg: "The field is required");
                            } else {
                              cancelOrder_Controller
                                  .datafetchfromCancelorderService(
                                      orderID: get_order_controller.orderid
                                          .toString(),
                                      Reason: reason.toString(),
                                      Comments: get_order_controller
                                          .additionalcomment_Text
                                          .toString())
                                  .then((value) async {
                                await notification_controller
                                    .fetchdatafromhistoryservice()
                                    .then((value) {
                                  Get.back();
                                });
                                await get_order_controller
                                    .datafetchfromgetorderService();
                                Navigator.of(context).pop();
                              });
                              // cancelOrder_Controller
                              //     .datafetchfromCancelorderService(
                              //         orderID: get_order_controller.orderid
                              //             .toString(),
                              //         Reason: reason.toString(),
                              //         Comments: get_order_controller
                              //             .additionalcomment_Text
                              //             .toString());

                              setState(() {});
                            }

                            // get_order_controller.orderid,
                            // reason
                            // get_order_controller.additionalcomment_Text
                          },
                          style: ElevatedButton.styleFrom(
                            primary: appcolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            textStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    letterSpacing: 1.5,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          ),
                          child: Text(
                            'CANCEL ORDER',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }
}
