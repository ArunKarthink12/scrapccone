import 'package:zero_scarp/allpackages.dart';

import '../../controller/homescreen_controller.dart';

class ApartmentViewMore extends StatefulWidget {
  const ApartmentViewMore({Key? key}) : super(key: key);

  @override
  State<ApartmentViewMore> createState() => _ApartmentViewMoreState();
}

class _ApartmentViewMoreState extends State<ApartmentViewMore> {
  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeScreen_separate_Controller
          .gethome[0].data![0].subcategory!.length,
      //  padding: EdgeInsets.only(top: 30),
      itemBuilder: (context, index) {
        return Card(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.11,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      homeScreen_separate_Controller.gethome[0].data![0]
                          .subcategory![index].subcategoryImage!
                          .toString(),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                            homeScreen_separate_Controller.gethome[0].data![0]
                                .subcategory![index].subcategoryName!
                                .toString(),
                            style: socialbutton),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text("210/kg", style: socialbutton),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
          ]),
        );
      },
    );
  }
}
