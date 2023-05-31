import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/category_controller.dart';
import 'package:zero_scarp/controller/subcategory_controller.dart';
import 'package:zero_scarp/controller/subcategory_type_controller.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  AssetImage? images;
  CategoryController categoryController = Get.put(CategoryController());
  SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  SubCategoryTypeController subCategoryTypeController =
      Get.put(SubCategoryTypeController());
  @override
  void initState() {
    super.initState();
    images = const AssetImage(
      "assets/img/Done.gif",
    );
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenbackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15.0.hp,
              ),
              Container(
                height: 40.0.hp,
                width: 80.0.wp,
                decoration:
                    BoxDecoration(image: DecorationImage(image: images!)),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              Text(
                'Successfully Placed',
                style: GoogleFonts.jost(
                    textStyle: TextStyle(
                        fontSize: 15.0.sp,
                        color: const Color(0xff5EBDB7),
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              InkWell(
                onTap: () {
                  Get.offAll(HomePage());
                  // Navigator.pop(context);
                },
                child: Text(
                  'Go to Home',
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
