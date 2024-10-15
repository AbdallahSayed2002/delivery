import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/model/items_model.dart';
import '../../routes_name.dart';
import 'package:hive/hive.dart';

abstract class FavoriteController extends GetxController {
  void toggleFavorite(ItemsModel item);

  void goToItemDetails(ItemsModel item);

  Future<bool> isFavorite(int itemId);

  Future<List<ItemsModel>> getFavoriteItems();

  void checkSearch(String val); // Added this abstract method
}

class FavoriteControllerImp extends FavoriteController {
  Box<ItemsModel> favoritesBox = Hive.box<ItemsModel>('favoritesBox');
  bool isSearch = false;
  late TextEditingController searchController;
  List<ItemsModel> filteredItems = [];

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  Future<List<ItemsModel>> getFavoriteItems() async {
    // Return the filtered list when search is active
    if (isSearch) {
      return filteredItems;
    }
    // Otherwise, return all favorite items
    return favoritesBox.values.toList();
  }

  @override
  void checkSearch(String val) {
    if (val.isEmpty) {
      isSearch = false;
      filteredItems = []; // Clear filtered items when search is cleared
    } else {
      isSearch = true;
      String query = val.toLowerCase();

      // Filter the favorite items based on the search query in both name and title
      filteredItems = favoritesBox.values
          .where((item) =>
      (item.name!.toLowerCase().contains(query)) ||
          (item.title!.toLowerCase().contains(query) ?? false)) // Check title if it's not null
          .toList();
    }
    update(); // Update the UI
  }

  @override
  void toggleFavorite(ItemsModel item) {
    if (favoritesBox.containsKey(item.id)) {
      favoritesBox.delete(item.id); // Remove if it's already in favorites
    } else {
      favoritesBox.put(item.id, item); // Add to favorites if not already added
    }
    update(); // Refresh the UI
  }

  @override
  Future<bool> isFavorite(int itemId) async {
    return favoritesBox.containsKey(itemId);
  }

  @override
  void goToItemDetails(ItemsModel item) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"item": item});
  }

  @override
  void onClose() {
    searchController.dispose(); // Clean up the search controller
    super.onClose();
  }
}
