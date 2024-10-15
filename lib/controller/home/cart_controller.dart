import 'package:delivery/data/model/items_model.dart';
import 'package:delivery/routes_name.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

abstract class CartController extends GetxController {
  void toggleCart(ItemsModel item);
  void toRemoveCart(ItemsModel item);
  void goToItemDetails(ItemsModel item);
  void itemNumberAdd(ItemsModel item);
  void itemNumberRemove(ItemsModel item);
  Future<bool> isAdded(int itemId);
  Future<List<ItemsModel>> getCartItems();
}

class CartControllerImp extends CartController {
  Box<ItemsModel> cartBox = Hive.box<ItemsModel>('cartBox');
  RxBool isAddedToCart = false.obs;
  RxMap<int, int> quantities = <int, int>{}.obs; // Reactive map for quantities
  RxDouble totalAmount = 0.0.obs; // Reactive total amount
  RxInt cartBoxLength = 0.obs;

  @override
  Future<void> onReady() async {
    //cartBox = await Hive.openBox<ItemsModel>("cartBox");
    cartBoxLength.value = cartBox.length;

    // Initialize the quantities map from the cartBox
    for (var item in cartBox.values) {
      quantities[item.id] = item.quantity ?? 1;
    }

    updateTotal(); // Calculate initial total

    // Listen for changes in the cart box
    cartBox.listenable().addListener(() {
      cartBoxLength.value = cartBox.length;
      updateTotal(); // Update total when cart changes
    });
    super.onReady();
  }

  // Toggle item in the cart (add/remove)
  @override
  void toggleCart(ItemsModel item) {
    if (cartBox.containsKey(item.id)) {
      cartBox.delete(item.id); // Remove from cart
      quantities.remove(item.id); // Remove from quantities map
    } else {
      cartBox.put(item.id, item); // Add item to cart
      quantities[item.id] = item.quantity ?? 1; // Set the initial quantity
    }

    cartBoxLength.value = cartBox.length; // Update cart length
    updateTotal(); // Recalculate total
  }

  // Increment item quantity
  @override
  void itemNumberAdd(ItemsModel item) {
    int currentQuantity = quantities[item.id] ?? 0;
    currentQuantity++;
    updateItemQuantity(item, currentQuantity); // Update item quantity
  }

  // Decrement item quantity
  @override
  void itemNumberRemove(ItemsModel item) {
    int currentQuantity = quantities[item.id] ?? 1;
    if (currentQuantity > 1) {
      currentQuantity--;
      updateItemQuantity(item, currentQuantity); // Update item quantity
    } else {
      cartBox.delete(item.id);
      quantities.remove(item.id); // Remove from quantities map
      updateTotal();
    }
  }

  // Update the item quantity in both Hive and the reactive state
  void updateItemQuantity(ItemsModel item, int newQuantity) {
    item.quantity = newQuantity; // Update quantity in the item model
    cartBox.put(item.id, item); // Save updated item in Hive
    quantities[item.id] = newQuantity; // Update the reactive quantities map
    updateTotal(); // Recalculate total amount
  }

  // Remove item from the cart
  @override
  void toRemoveCart(ItemsModel item) {
    cartBox.delete(item.id);
    quantities.remove(item.id); // Remove from quantities map
    updateTotal(); // Recalculate total amount
  }

  // Get item quantity
  int getItemQuantity(int itemId) {
    return quantities[itemId] ?? 1; // Default to 1 if not found
  }

  // Check if item is in the cart
  @override
  Future<bool> isAdded(int itemId) async {
    return cartBox.containsKey(itemId);
  }

  // Navigate to item details
  @override
  void goToItemDetails(ItemsModel item) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"item": item});
  }

  // Calculate the total cost and update the reactive totalAmount
  void updateTotal() {
    double total = cartBox.values.fold(0.0, (sum, item) {
      final price = item.price ?? 0.0;
      final quantity = item.quantity ?? 1;
      return sum + (price * quantity);
    });
    totalAmount.value = total; // Update the reactive total
  }

  // Get all cart items as a list
  @override
  Future<List<ItemsModel>> getCartItems() async {
    return cartBox.values.toList();
  }
}