import 'package:zero_scarp/allpackages.dart';
// import 'package:zero_scarp/view/category/apartment_list.dart';

import '../../controller/homescreen_controller.dart';
import 'individual_view_more_screen.dart';

class IndividualHome extends StatefulWidget {
  const IndividualHome({Key? key}) : super(key: key);

  @override
  State<IndividualHome> createState() => _IndividualHomeState();
}

class _IndividualHomeState extends State<IndividualHome> {
  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          // height: 25.0.hp,
          width: 100.0.wp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homeScreen_separate_Controller
                            .gethome[0].data![1].categoryName!
                            .toString(),
                        style: listtitle,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(IndividualHomeViewMoreScreen());
                            },
                            child: Text(
                              'View more',
                              style: viewmore,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: appcolor1,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                            child: Text('IMAGE',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 9.0.sp,
                                        // MediaQuery.of(context).size.height *
                                        //     0.016,
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
                            child: Text('SUB_CATEGORY',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 9.0.sp,
                                        // MediaQuery.of(context).size.height *
                                        //     0.016,
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
                                        fontSize: 9.0.sp,
                                        // MediaQuery.of(context).size.height *
                                        //     0.016,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ]),
                ),
                IndividualHomeList()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
