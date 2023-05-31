// ServiceModelService
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/servicemodel.dart';

// import '../service/arealocationservice.dart';
import '../service/servicemodelservice.dart';
// import '../view/livelocation/book.dart';

class ServiceController extends GetxController {
  RxBool serviceload = true.obs;
  RxList<Servicemodel> servicelist = <Servicemodel>[].obs;
  Rx<int> selectedIndex = 0.obs;
  var areaservice = ServiceModelService();

  Future servicelocationcontroller({city, area, context}) async {
    serviceload(true);
    if (serviceload.value) {
      _loadingBar(context);
    }
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);

      ///getString token in local variable
      /// filldetailsLoad(true);

      var response = await areaservice.servicemodelservicefunction(
          city: city, area: area, context: context);

      if (response != null) {
        Get.back();
        if (response.area.first.service != 'No') {
          token != null ? Get.to(const HomePage()) : Get.to(LoginScreen());
        } else {
          // fun(context);
          serviceload(false);

          areaLocation(context);
          // Get.to(const Noservice());
        }
        servicelist.clear();
        servicelist.add(response);
        // allBooks.add(response);
        serviceload(false);
      } else {
        Get.back();
        serviceload(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }

  areaLocation(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding: EdgeInsets.only(
                  top: 8.0.sp, bottom: 8.0, left: 5.0, right: 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: SizedBox(
                height: 46.5.hp,
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset(
                        "assets/images/Animation.gif",
                        height: 33.0.hp,
                        // 194,
                        width: 88.0.wp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.0.wp,
                          left: 79.0.wp,
                          bottom: 56.0.wp,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/images/Vector_1.png", height: 3.0.hp,
                              // 194,
                            )),
                      ),
                    ]),
                    Text(
                      textAlign: TextAlign.center,
                      'Service is not available for this\nlocation...',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0.sp),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(98, 35), //////// HERE
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                        //return true when click on "Yes"
                        child: Text(
                          'Okay',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        //  errorDialog
        );
  }
}
