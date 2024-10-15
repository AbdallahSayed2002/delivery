import 'package:delivery/routes_name.dart';
import 'package:delivery/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../data/model/items_model.dart';

abstract class HomeController extends GetxController {
  initialData();
  goItems(List categories, int selectedCat);
  void changeCat(int val);
  void goToItemDetails(ItemsModel item);
}

class HomeControllerImp extends HomeController {
  late List<ItemsModel> items;
  List<ItemsModel> filteredItems = [];
  int selectedCat = 0; // Default selected category
  List categories = categoriesList; // Static categories
  bool isSearch = false;
  late TextEditingController searchController;

  @override
  initialData() {
    searchController = TextEditingController();
    // Ensure that items and categories are not null or empty
    items = itemsList;
    filterItems(); // Initial filtering by category
  }

  @override
  void onInit() {
    initialData();
    if (items.isEmpty && kDebugMode) {
      print("No items found!");
    }
    super.onInit();
  }

  // Handles search input and refines the item list accordingly
  void checkSearch(String val) {
    if (val.isEmpty) {
      isSearch = false;
      filterItems(); // Show all items for the selected category
    } else {
      isSearch = true;
      String query = val.toLowerCase();
      // Filter items based on search query matching the name or title
      filteredItems = items.where((item) =>
      item.name!.toLowerCase().contains(query) ||
          (item.title!.toLowerCase().contains(query) ?? false)).toList();
    }
    update(); // Notify the UI of changes
  }

  void filterItems() {
    if (selectedCat != null) {
      String? selectedCategoryName = categories[selectedCat!].name;
      filteredItems = items.where((item) => item.type == selectedCategoryName).toList();
    }
  }

  @override
  goItems(categories, selectedCat) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
    });
  }

  @override
  void goToItemDetails(ItemsModel item) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"item": item});
  }

  // Change selected category and apply filtering
  @override
  void changeCat(int val) {
    selectedCat = val;
    filterItems(); // Re-filter items when category changes
  }

  @override
  void onClose() {
    searchController.dispose(); // Clean up the controller to avoid memory leaks
    super.onClose();
  }
}
