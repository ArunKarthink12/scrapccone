import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/notification_Controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Notification_Controller notification_controller =
      Get.put(Notification_Controller());

  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await notification_controller.fetchdatafromhistoryservice();
    }); // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(HomePage());
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              elevation: 10,
              backgroundColor: const Color(0xff283736),
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                'NOTIFICATION',
                style: apptitle,
              )),
          body:
              // SmartRefresher(
              //   controller: _refreshController,
              //   onRefresh: () async {
              //     final result =
              //         await notification_controller.fetchdatafromhistoryservice();
              //     if (result) {
              //       _refreshController.refreshCompleted();
              //     }
              //   },
              // child:
              SingleChildScrollView(
            child: Obx(() {
              if (notification_controller.loodingindicator.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (notification_controller
                  .notificationcontrollerList.isEmpty) {
                return Container(
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      "No Notifications Yet!",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    NotificationList(),
                  ],
                );
              }
            }),
          ),
        ),
      ),
      // ),
    );
  }
}
