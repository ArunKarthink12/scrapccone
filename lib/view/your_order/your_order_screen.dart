import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zero_scarp/allpackages.dart';
import '../../controller/getorder_controller.dart';

class YourOrderScreen extends StatefulWidget {
  const YourOrderScreen({Key? key}) : super(key: key);

  @override
  State<YourOrderScreen> createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    get_order_controller.datafetchfromgetorderService();
    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            'ORDER',
            style: apptitle,
          )),
      body: SafeArea(
          child: SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
          final result =
              await get_order_controller.datafetchfromgetorderService();
          if (result) {
            _refreshController.refreshCompleted();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              YourOrderList(),
            ],
          ),
        ),
      )),
    );
  }
}
