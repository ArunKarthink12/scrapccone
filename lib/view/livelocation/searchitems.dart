import 'dart:developer';

import 'package:zero_scarp/controller/arealocationservice.dart';
// import 'package:zero_scarp/view/livelocation/book_data.dart';
// import 'package:zero_scarp/view/livelocation/book.dart';
// import 'package:zero_scarp/view/livelocation/book_data.dart';
import 'package:zero_scarp/view/livelocation/search_widget.dart';

import '../../allpackages.dart';
import '../../controller/getProfile_controller.dart';
import '../../controller/servicecontroller.dart';
// import '../../model/arealocationmodel.dart';
import 'book.dart';
// import 'book_data.dart';
// import 'book.dart';
// import '../../model/arealocationmodel.dart';

class ExampleApp extends StatefulWidget {
  var books;
  var city;
  ExampleApp({Key? key, this.books, this.city}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  Arealocation_Controller arealocation_controller =
      Get.put(Arealocation_Controller());
  String query = '';

  void filter(String match) {
    setState(() {
      arealocation_controller.allBooks.value = arealocation_controller
          .arealist[0].area
          .where(
              (data) => data.area.toLowerCase().contains(match.toLowerCase()))
          .toList();
    });
    log("search${arealocation_controller.allBooks.length}".toString());
    log("all${arealocation_controller.arealist[0].area.length}".toString());
  }

  // @override
  // void initState() {
  //   // arealocation_controller.cityclocationController(city: widget.books);
  //   // fetchdata();
  //   // TODO: implement initState
  //   super.initState();
  // }

  ServiceController serviceController = Get.put(ServiceController());
  // String? token;
  // fetchdata() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   log('token');
  //   log(sharedPreferences.getString(Constants.authToken).toString());
  //   // token =
  //   sharedPreferences.getString(Constants.authToken).toString();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 10.0.hp,
        width: double.infinity,
        child: Column(
          children: [
            buildSearch(),
            // Obx(() {
            //   return
            Expanded(
                child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3.6 / 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 20),
              itemCount:
                  // query.isEmpty
                  // arealocation_controller.allBooks.isEmpty
                  // ? arealocation_controller.arealist[0].area.length
                  // :
                  arealocation_controller.allBooks.length,
              // filtered.length,
              // arealocation_controller.arealist[0].area.length,
              // widget.books.length,
              itemBuilder: (context, index) {
                final book =
                    // arealocation_controller.allBooks.isEmpty
                    // ?
                    // arealocation_controller.arealist[0].area[index]
                    // :
                    arealocation_controller.allBooks[index];
                // final searchbooks = arealocation_controller.allBooks[index];
                return
                    // arealocation_controller.allBooks.isEmpty
                    // ? searchbuildBook(searchbooks)
                    // :
                    buildBook(book, context);
              },
            )),
            // }),
          ],
        ));
  }

  // Widget searchbuildBook(searchbooks) => GestureDetector(
  //       onTap: () {
  //         serviceController.servicelocationcontroller(
  //             area: searchbooks['area'], city: searchbooks['city']);
  //       },
  //       child: Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           SizedBox(
  //             height: 15.0.hp,
  //             width: 35.0.wp,
  //             child: Image.asset('assets/img/citybg.png'),
  //           ),
  //           SizedBox(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.location_on,
  //                   size: 26.0.sp,
  //                 ),
  //                 SizedBox(
  //                   height: 1.0.hp,
  //                 ),
  //                 Container(
  //                   alignment: Alignment.center,
  //                   width: 30.0.wp,
  //                   child: Text(
  //                     searchbooks['area'].toString(),
  //                     textAlign: TextAlign.center,
  //                     style: GoogleFonts.roboto(
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 11.0.sp,
  //                         color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  Widget buildBook(Area book, context) {
    token() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(Constants.city, book.city);
      sharedPreferences.setString(Constants.area, book.area);

      // token = sharedPreferences.setString(Constants.city);
      // token = sharedPreferences.setString(Constants.area);
    }

    ProfileController profileController = Get.put(ProfileController());

    return GestureDetector(
      onTap: () {
        token();
        // profileController.locationarea.value = book.area;
        // profileController.locationcity.value = book.city;

        serviceController.servicelocationcontroller(
            area: book.area, city: book.city, context: context);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 15.0.hp,
            width: 35.0.wp,
            child: Image.asset('assets/img/citybg.png'),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 26.0.sp,
                ),
                SizedBox(
                  height: 1.0.hp,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30.0.wp,
                  child: Text(
                    book.area.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 11.0.sp,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() =>
      SearchWidget(text: query, hintText: 'Search your area', onChanged: filter
          //  searchBook,
          //  (value) => searcharea(value),
          );
}

// void searchBook(String query) {
//   final bookss =
//       //  arealocation_controller.arealist[0].area.
//       arealocation_controller.allBooks.where((book) {
//     final titleLower = book.area.toLowerCase();
//     final searchLower = query.toLowerCase();
//     return titleLower.contains(searchLower);
//   }).toList();

//   setState(() {
//     this.query = query;
//     widget.books = bookss;
//   });
// }
