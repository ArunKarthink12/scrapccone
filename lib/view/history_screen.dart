import 'dart:developer';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/history_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  History_Controller history_controller = Get.put(History_Controller());
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // log("list--->${history_controller.historycontrollerList.length}");

    history_controller.historycontroller();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('onwilll-----------');
        Get.offAll(const HomePage());
        return true;
      },
      child: Obx(() {
        if (history_controller.loodingindicator.value) {
          return Scaffold(
            appBar: AppBar(
                elevation: 10,
                backgroundColor: const Color(0xff283736),
                centerTitle: true,
                title: Text(
                  'HISTORY',
                  style: apptitle,
                )),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (history_controller.historycontrollerList.isEmpty) {
          return Scaffold(
            appBar: AppBar(
                elevation: 10,
                backgroundColor: const Color(0xff283736),
                centerTitle: true,
                title: Text(
                  'HISTORY',
                  style: apptitle,
                )),
            body: Center(
              child: Text(
                "No Orders Yet!",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 10,
                backgroundColor: const Color(0xff283736),
                centerTitle: true,
                title: Text(
                  'HISTORY',
                  style: apptitle,
                )),
            body: SafeArea(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () async {
                  final result = await history_controller.historycontroller();
                  if (result) {
                    _refreshController.refreshCompleted();
                  }
                },
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    HistoryList(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              ),
            ),
          );
        }
      }),
    );
  }
}
