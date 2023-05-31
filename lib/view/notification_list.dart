import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/notification_Controller.dart';
import 'package:zero_scarp/view/your_order/singleorder_orderid_Base.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  Notification_Controller notification_controller =
      Get.put(Notification_Controller());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        child: ListView.builder(
            itemCount: notification_controller
                .notificationcontrollerList[0].data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notification_controller
                      .notificationcontrollerList.first.data[index].data.length,
                  itemBuilder: (context, snapshot) {
                    return Column(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              notification_controller
                                          .notificationcontrollerList[0]
                                          .data[index]
                                          .title ==
                                      "Order Confirmed"
                                  ? Get.to(Single_Order_Order_base(
                                      orderid: notification_controller
                                          .notificationcontrollerList[0]
                                          .data[index]
                                          .data[snapshot]
                                          .orderId
                                          .toString(),
                                    ))
                                  : Fluttertoast.showToast(
                                      msg: "Order Cancelled by the User");
                            },
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 97.0.wp,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 2, color: const Color(0xffF5F5F5)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0,
                                          right: 5,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                notification_controller
                                                    .notificationcontrollerList[
                                                        0]
                                                    .data[index]
                                                    .data[snapshot]
                                                    .profileImage
                                                    .toString()),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 2),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          notification_controller
                                                              .notificationcontrollerList[
                                                                  0]
                                                              .data[index]
                                                              .title,
                                                          style:
                                                              notificationtitle,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            notification_controller
                                                                .notificationcontrollerList[
                                                                    0]
                                                                .data[index]
                                                                .data[snapshot]
                                                                .date
                                                                .toString(),
                                                            style:
                                                                notificationtime,
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Image.asset(
                                                            'assets/images/right.png',
                                                            height: 10,
                                                            width: 10,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          notification_controller
                                                              .notificationcontrollerList[
                                                                  0]
                                                              .data[index]
                                                              .description,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              notificationsubtitle,
                                                        ),
                                                      ),
                                                    ],
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
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        )
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
