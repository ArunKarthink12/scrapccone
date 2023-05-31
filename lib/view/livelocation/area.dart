// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:developer';
// import 'dart:io';

import 'package:zero_scarp/allpackages.dart';

import '../../controller/citylocationcontroller.dart';
import 'livelocation.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen>
    with SingleTickerProviderStateMixin {
  // var city = [
  //   "Coimbatore",
  //   'Thiruppur',
  //   'Erode',
  // ];
  // String? token;
  // tokenlog() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   token = sharedPreferences.getString(Constants.authToken);
  // }

  Citylocation_Controller citylocation_controller =
      Get.put(Citylocation_Controller());
  AssetImage? images;
  // late AnimationController expandController;
  // late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    citylocation_controller.cityclocationController();
    images = const AssetImage(
      "assets/images/Directions.gif",
    );
    checkLogin();
    // FlutterNativeSplash.remove();
    // expandController =
    //     AnimationController(duration: const Duration(seconds: 5), vsync: this);
    // animation =
    //     new CurvedAnimation(parent: expandController, curve: Curves.linear);
    // expandController.repeat();
  }

  String? token;
  checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(Constants.authToken);
    log('tokeen');
    log(token.toString());
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  // back() {
  //   // Navigator.pop(context);
  //   // exit(0);
  //   SystemNavigator.pop();
  //   // return null;
  // }
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      token!.isEmpty ? Fluttertoast.showToast(msg: "Double Tap to Exit") : null;
      return token!.isEmpty ? Future.value(false) : Future.value(true);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appcolor,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                color: appcolor,
              ),
              DraggableScrollableSheet(
                builder: (BuildContext buildContext,
                    ScrollController scrollController) {
                  return Material(
                      elevation: 5,
                      shadowColor: Colors.black,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              SizedBox(height: 4.0.hp),
                              Container(
                                height: 40.0.hp,
                                width: 80.0.wp,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: images!)),
                              ),
                              //  SizedBox(height: 4.00.hp),
                              SizedBox(
                                child: Text(
                                  'Choose your City',
                                  style: toptitleStyle,
                                ),
                              ),
                              SizedBox(
                                height: 1.0.hp,
                              ),
                              SizedBox(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Our services are only available inside these cities..',
                                  style: subtitleStyle,
                                ),
                              ),

                              SizedBox(
                                height: 1.5.hp,
                              ),
                              Obx(() {
                                if (citylocation_controller.cityload.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (citylocation_controller
                                    .citylist.isEmpty) {
                                  return const Center(
                                    child: Text("Ther is No City"),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 35.0.hp,
                                    child: GridView.builder(
                                      controller: scrollController,
                                      // scrollDirection: Axis.vertical,
                                      itemCount: citylocation_controller
                                          .citylist[0].city.length,
                                      //  city.length,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            //Area Widget is the city screen
                                            // token == null
                                            // ?
                                            var city = citylocation_controller
                                                .citylist[0].city[index].city;
                                            Get.to(AreasScreen(city: city));
                                            // : Get.to(HomePage());
                                            // Get.to(Area());
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                height: 13.0.hp,
                                                width: 32.0.wp,
                                                child: Image.asset(
                                                    'assets/img/citybg.png'),
                                              ),
                                              SizedBox(
                                                // alignment: Alignment.center,
                                                child: Column(
                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 28.0.sp,
                                                    ),
                                                    SizedBox(
                                                      height: 1.0.hp,
                                                    ),
                                                    Text(
                                                      citylocation_controller
                                                          .citylist[0]
                                                          .city[index]
                                                          .city
                                                          .toString(),
                                                      style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 11.0.sp,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      ));
                },
                // minChildSize<=initialChildSize
                // initial size of the sheet when app is opened.
                // default value 0.5
                initialChildSize: .9, //will take 30% of screen space
                //minimum size to which sheet can be dropped down.
                // default value .25
                minChildSize: .85,

                //max size to which  sheet can be dragged up
                //default value 1.0
                maxChildSize: 0.95,
              ),
            ],
          )),
    );
  }
}
