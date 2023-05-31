import 'dart:io';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/addtocartcontroller.dart';

import '../../controller/confirmorderController.dart';
import '../../controller/fill_details_controller.dart';

class ConfirmScreen extends StatefulWidget {
  var withgstamount;
  var withouttgstamount;
  var selectedgst;
  ConfirmScreen(
      {Key? key, this.withgstamount, this.withouttgstamount, this.selectedgst})
      : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  ConfirmOrderController confirmOrderController =
      Get.put(ConfirmOrderController());
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5EBDB7),
      appBar: AppBar(
          elevation: 10,
          backgroundColor: const Color(0xff283736),
          centerTitle: true,
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
            'CONFIRM YOUR DETAILS',
            style: apptitle,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              width: 100.0.wp,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0))),
              child: Column(
                children: [
                  YourProductSection(selectedgst: widget.selectedgst),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Details',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 14.0.sp,
                                color: const Color(0xff263238),
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  YourDetailSection(selectedgst: widget.selectedgst),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  SizedBox(
                    height: 31.0.hp,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Image.file(
                        File(fillDetailsController.image.path.toString()),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100.0.wp,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: const Color(0xff283736),
                          border: Border.all(
                            color: const Color(0xff283736),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: ElevatedButton(
                        onPressed: () {
                          //https://propluslogics.in/zero_scrap_api/api/confirm_order
                          confirmOrderController.confirmcontroller(
                            addToCartController.carlist[0].orderId.toString(),
                            context,
                          );
                          // Get.to(const OrderPlacedScreen());
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CLICK TO CONFIRM',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 11.0.sp,
                                      letterSpacing: 1.5,
                                      color: screenbackground,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Image.asset(
                                'assets/images/double_left.png',
                                height: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
