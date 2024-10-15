import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/items_model.dart';
import '../../data/model/user_model.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // Initialize Hive and Flutter Hive
    await Hive.initFlutter();

    // Register Hive adapters with unique type IDs
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelAdapter()); // typeId: 0
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ItemsModelAdapter()); // typeId: 1
    }

    // Open Hive boxes for user, favorites, and cart
    if (!Hive.isBoxOpen('userBox')) {
    await Hive.openBox<UserModel>("userBox");
    }
    if (!Hive.isBoxOpen('favoritesBox')) {
    await Hive.openBox<ItemsModel>('favoritesBox');
    }
    if (!Hive.isBoxOpen('cartBox')) {
    await Hive.openBox<ItemsModel>('cartBox');
    }

    // Initialize SharedPreferences
    sharedPreferences = await SharedPreferences.getInstance();

    // Uncomment the line below if Firebase is required
    // await Firebase.initializeApp();

    return this;
  }
}

// Initialize services at app startup
Future<void> initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
