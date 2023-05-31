import 'dart:io';

// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getProfile_controller.dart';
// import 'package:zeroscrap_update/controller/zeroscrap_update_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileController profileController = Get.put(ProfileController());
  int currentIndex = 0;
  final List pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const NotificationScreen(),
    const MenuScreen(),
  ];
  @override
  void initState() {
    profileController.profileimage = File('');
    token();

    // ZeroScrapUpdate.init(
    //     context: context, version: Constants.version, url: Urls.appUpdate);
    // print(" sddfggh${Urls.appUpdate}");
    // FlutterNativeSplash.remove();
    // TODO: implement initState
    super.initState();
  }

  void _incrementCounter() {
    launchWhatsAppUri();

    setState(() {});
  }

  launchWhatsAppUri() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+917010637900',
      text: "",
    );
    await launch(link.asUri().toString());
  }

  token() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    profileController.locationcity.value =
        sharedPreferences.getString(Constants.city)!;
    profileController.locationarea.value =
        sharedPreferences.getString(Constants.area)!;
  }

  // _onItemTapped(int index) {
  //   profileController.selectedIndex.value = index;
  //   Get.forceAppUpdate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            tooltip: 'chat',
            onPressed: _incrementCounter,
            child: SizedBox(
                height: 9.0.hp,
                width: 13.0.wp,
                child: Image.asset(
                  "assets/img/chatsupport.png",
                  // fit: BoxFit.cover,
                ))),
        backgroundColor: Colors.white,
        body: pages[currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3, bottom: 5),
          child: BottomNavyBar(
            containerHeight: 50,
            selectedIndex: currentIndex,
            showElevation: false,
            itemCornerRadius: 24,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => currentIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.home,
                  size: 20,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text('Home'),
                ),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.history,
                  size: 20,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text('History'),
                ),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.notifications,
                  size: 20,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Notification',
                      // style: GoogleFonts.poppins(
                      //     textStyle: TextStyle(
                      //         letterSpacing: 1,
                      //         fontSize: 9.00.sp,
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.menu,
                  size: 20,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text('Menu'),
                ),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
