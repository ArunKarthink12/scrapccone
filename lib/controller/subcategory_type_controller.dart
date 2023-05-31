import 'package:zero_scarp/allpackages.dart';
import '../model/subctegory_type_response.dart';
import '../service/subcategory_type_service.dart';

class SubCategoryTypeController extends GetxController {
  RxBool subcategorytypeLoad = true.obs;
  RxList<SubCategoryTypeModel> getsubcategorytype =
      <SubCategoryTypeModel>[].obs;
  RxList subCategoryList = [].obs;
  RxList<List<ProductQuantity>> productquantity = <List<ProductQuantity>>[].obs;
  RxList<int> color = <int>[].obs;

  TextEditingController quanitiycotroller = TextEditingController();
  RxList<ProductQuantity> selectOrderList = <ProductQuantity>[].obs;

  Future subCategorytypeController({subCategoryID}) async {
    try {
      var response = await SubCategoryTypeService.subCategoryTypeService(
          subcategoryId: subCategoryID);

      if (response != null) {
        getsubcategorytype.clear();
        selectOrderList.clear();
        subCategoryList.clear();
        color.clear();

        getsubcategorytype.add(response);

        ///Actual prize
        for (var i = 0; i < response.data!.materialType!.length; i++) {
          color.add(0);

          ///Actual prize
          subCategoryList
              .add(response.data!.materialType![i].materialSubtype![0].price!);

          selectOrderList.add(ProductQuantity(
              type: response.data!.materialType![i].materialName,
              // materialSubtype![0].type!,
              id: response.data!.materialType![i].materialSubtype![0].id!,
              price: 0,
              quantity: 0));
        }

        subcategorytypeLoad(false);
      } else {
        subcategorytypeLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class ProductQuantity {
  int? id;
  int? quantity;
  int? price;
  String? type;
  ProductQuantity(
      {required this.type,
      required this.id,
      required this.price,
      required this.quantity});
}

class FinalOrder {
  int id;
  int quantity;

  FinalOrder({required this.id, required this.quantity});
}
