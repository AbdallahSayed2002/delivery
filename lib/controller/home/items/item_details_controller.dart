import 'package:delivery/controller/home/cart_controller.dart';
import 'package:delivery/controller/home/favorite_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/model/items_model.dart';

abstract class ItemDetailsController extends GetxController {
  void initData();

  ItemsModel? get item;

  void onImageChanged(int index);

  void itemNumberAdd();

  void itemNumberRemove();

  void next();

  void detailChange();
}

class ItemDetailsControllerImp extends ItemDetailsController {
  ItemsModel? _item;
  int currentImageIndex = 0;
  String text = "See More Detail";
  IconData icon = CupertinoIcons.chevron_down;
  int currentLines = 2;

  late PageController pageController;
  String _selectedColor = "White";
  Map<int, bool> favoriteStatus = {};
  late FavoriteControllerImp favoriteController;
  late CartControllerImp cartController;

  @override
  void onInit() {
    favoriteController = Get.put(FavoriteControllerImp());
    cartController = Get.put(CartControllerImp());
    initData();
    pageController = PageController(initialPage: currentImageIndex);

    // Sync page index with image index
    pageController.addListener(() {
      int newPage = pageController.page!.round();
      if (newPage != currentImageIndex) {
        onImageChanged(newPage);
      }
    });

    super.onInit();
  }

  @override
  void initData() {
    _item = Get.arguments["item"];
    // Initialize selectedColor if there's a color set in the item.
  }

  @override
  ItemsModel? get item => _item;

  String get selectedColor => _selectedColor;

  set selectedColor(String value) {
    _selectedColor = value;
    update(); // Update the UI when the color is selected
  }

  @override
  void onImageChanged(int index) {
    currentImageIndex = index;
    update(); // Update the UI when image index changes
  }

  @override
  void next() {
    if (currentImageIndex < item!.image.length - 1) {
      currentImageIndex++;
      pageController.animateToPage(
        currentImageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      update(); // Update the UI after page animation
    }
  }

  @override
  void itemNumberAdd() {
    if (_item != null) {
      _item!.quantity = (_item!.quantity ?? 1) + 1; // Increase the quantity

      // Ensure the quantity doesn't exceed the available stock
      if (_item!.numberOfItem != null && _item!.quantity! > _item!.numberOfItem!) {
        _item!.quantity = _item!.numberOfItem!;
      }
      update(); // Notify the UI about the change
    }
  }

  @override
  void itemNumberRemove() {
    if (_item != null) {
      _item!.quantity = (_item!.quantity ?? 1) - 1; // Decrease the quantity

      // Ensure quantity doesn't go below 1
      if (_item!.quantity! < 1) {
        _item!.quantity = 1;
      }
      update(); // Notify the UI about the change
    }
  }

  @override
  void detailChange() {
    // Toggle between showing more and less detail
    if (currentLines == 2) {
      currentLines = 999;
      text = "See Less Detail";
      icon = CupertinoIcons.chevron_up;
    } else {
      currentLines = 2;
      text = "See More Detail";
      icon = CupertinoIcons.chevron_down;
    }
    update(); // Update UI when detail view changes
  }

  // Toggle favorite status for the item
  void toggleFavorite(ItemsModel item) {
    favoriteController.toggleFavorite(item);
    update(); // Notify UI to reflect favorite status change
  }

  // Check if the item is a favorite
  Future<bool> isFavorite(int itemId) async {
    return favoriteController.isFavorite(itemId);
  }

  // Toggle item in the cart (add/remove)
  void toggleCart(ItemsModel item) {
    cartController.toggleCart(item);
    update(); // Notify UI to update cart state
  }

  // Check if the item is already in the cart
  Future<bool> isAdded(int itemId) async {
    return cartController.isAdded(itemId);
  }
}
