import 'package:delivery/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../data/datasource/static/static.dart';
import '../../../data/model/items_model.dart';
import '../favorite_controller.dart';

abstract class ItemsController extends GetxController {
  void initData();
  void changeCat(int val);
  void goToItemDetails(ItemsModel item);
}

class ItemsControllerImp extends ItemsController {
  late List<ItemsModel> items; // Full list of items
  List<ItemsModel> filteredItems = []; // Filtered list after search or category change
  late List categories;
  int? selectedCat;
  late FavoriteControllerImp favoriteController;  // FavoriteController to manage favorites
  bool isSearch = false;
  late TextEditingController searchController;

  @override
  void onInit() {
    // Initialize the FavoriteController
    favoriteController = Get.put(FavoriteControllerImp());
    searchController = TextEditingController();
    initData();
    super.onInit();
  }

  @override
  void initData() {
    categories = Get.arguments["categories"] ?? categoriesList;
    selectedCat = Get.arguments["selectedCat"] ?? 0;
    items = itemsList; // Assuming itemsList is provided statically
    filterItems(); // Initial filtering based on the selected category
  }

  // Method to handle search input and update the filtered items
  void checkSearch(String val) {
    if (val.isEmpty) {
      isSearch = false;
      filterItems(); // Show all items for the selected category
    } else {
      isSearch = true;
      String query = val.toLowerCase();
      String? selectedCategoryName = categories[selectedCat!].name;
      // Filter items based on search query matching the name or title
      filteredItems = items.where((item) =>
      item.type == selectedCategoryName &&
          (item.name?.toLowerCase().contains(query) ?? false ||
              item.title!.toLowerCase().contains(query) ?? false)
      ).toList();

    }
    update(); // Notify the UI of changes
  }

  @override
  void changeCat(int val) {
    selectedCat = val;
    filterItems(); // Re-filter items based on the newly selected category
    update();
  }

  // Filters the items based on the selected category
  void filterItems() {
    if (selectedCat != null) {
      String? selectedCategoryName = categories[selectedCat!].name;
      filteredItems = items.where((item) => item.type == selectedCategoryName).toList();
    }
  }

  @override
  void goToItemDetails(ItemsModel item) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"item": item});
  }

  // Toggle favorite status of an item
  void toggleFavorite(ItemsModel item) {
    favoriteController.toggleFavorite(item);
    update(); // Refresh the UI after changing the favorite status
  }

  // Check if an item is marked as a favorite
  Future<bool> isFavorite(int itemId) async {
    return favoriteController.isFavorite(itemId);
  }
}
