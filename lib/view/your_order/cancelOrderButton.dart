import 'dart:developer';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zero_scarp/controller/getorder_controller.dart';

import '../../allpackages.dart';

class Cancel_Order_Button extends StatefulWidget {
  var fetchindex;
  Cancel_Order_Button({super.key, this.fetchindex});

  @override
  State<Cancel_Order_Button> createState() => _Cancel_Order_ButtonState();
}

class _Cancel_Order_ButtonState extends State<Cancel_Order_Button> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              color: const Color(0xff283736),
              border: Border.all(
                color: const Color(0xff283736),
              ),
              borderRadius: BorderRadius.circular(5)),
          child: ElevatedButton(
            onPressed: () {
              get_order_controller.orderid = get_order_controller
                  .getorderContorller[0]
                  .data!
                  .orderDetails![widget.fetchindex]
                  .orderId
                  .toString();
              log(get_order_controller.orderid);
              cancelreceivedorderBottomSheet(context);
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
              'CANCEL ORDER',
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 11.0.sp,
                      color: screenbackground,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ],
    );
  }

  cancelreceivedorderBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (context) {
          // get_order_controller.additionalComment.text = '';
          return CancelOrder(
            fetchOrderID: get_order_controller.orderid,
          );
        });
  }
}
