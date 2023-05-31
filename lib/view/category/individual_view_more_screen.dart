import 'package:zero_scarp/allpackages.dart';

import '../../controller/homescreen_controller.dart';
import 'individuallist.dart';

class IndividualHomeViewMoreScreen extends StatefulWidget {
  IndividualHomeViewMoreScreen({Key? key, this.image}) : super(key: key);
  String? image;

  @override
  State<IndividualHomeViewMoreScreen> createState() =>
      _IndividualHomeViewMoreScreenState();
}

class _IndividualHomeViewMoreScreenState
    extends State<IndividualHomeViewMoreScreen> {
  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());
  AssetImage? gifimage;
  @override
  void initState() {
    super.initState();
    gifimage = const AssetImage('assets/img/individualhome.gif');
    // print('${widget.asset} initState');
  }

  @override
  void dispose() {
    // print('${widget.asset} dispose');
    gifimage!.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
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
            homeScreen_separate_Controller.gethome[0].data![1].categoryName!
                .toString(),
            style: apptitle,
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: appcolor, image: DecorationImage(image: gifimage!)),
             
            ),
             Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 25.0.wp,
                      height: 5.0.hp,
                      decoration: BoxDecoration(
                        color: appcolor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text('Image',
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Container(
                      width: 25.0.wp,
                      height: 5.0.hp,
                      decoration: BoxDecoration(
                        color: appcolor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text('Sub_Category',
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Container(
                      width: 35.0.wp,
                      height: 5.0.hp,
                      decoration: BoxDecoration(
                        color: appcolor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text('STARTING PRICE/KG',
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ]),
            ),
            IndividualViewMoreList(),
            SizedBox(
              height: 4.0.hp,
            ),
          ],
        ),
      )),
    );
  }
}
