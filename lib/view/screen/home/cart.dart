import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/controller/home/cart_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/const_image.dart';
import '../../../data/model/items_model.dart';
import '../../widgets/home_screen/cart/check_out_card.dart';
import '../../widgets/home_screen/items/item_details/rounded_icon_btn.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());

    return FutureBuilder(
      future: Hive.openBox<ItemsModel>("cartBox"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        controller.cartBox = snapshot.data as Box<ItemsModel>;

        return Scaffold(
            backgroundColor: AppColor.loginPageColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Your Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            "${controller.cartBoxLength.value} ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "sana",
                                fontSize: 17),
                          ),
                        ),
                        const Text(
                          "items",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: "sana"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: FutureBuilder<List<ItemsModel>>(
              future: controller.getCartItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return GetBuilder<CartControllerImp>(
                    builder: (controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AppImageAssets.noDataLottie,
                            width: 450, height: 300),
                      ],
                    ),
                  );
                } else {
                  final cartItems = snapshot.data!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, i) {
                        final item = cartItems[i];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: InkWell(
                            onTap: () => controller.goToItemDetails(item),
                            child: Dismissible(
                              key: Key(item.id.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                controller.toRemoveCart(item);
                              },
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE6E6),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.trash,
                                      color: Color(0xFFFF4848),
                                    ),
                                  ],
                                ),
                              ),
                              child: GetBuilder<CartControllerImp>(
                                builder: (controller) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 88,
                                          child: AspectRatio(
                                            aspectRatio: 0.88,
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.lightBlue[100],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Hero(
                                                tag: item.id,
                                                child: CachedNetworkImage(
                                                    imageUrl: item.image[0]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${item.title}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$${item.price}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.red,
                                                      fontFamily: "sana"),
                                                ),
                                                Obx(() {
                                                  return Text(
                                                    " X${controller.getItemQuantity(item.id)}",
                                                    style: const TextStyle(
                                                      fontFamily: "sana",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  );
                                                }),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        RoundedIconBtn(
                                          icon: const Icon(Icons.remove),
                                          size: 30,
                                          color: Colors.white,
                                          onPressed: () {
                                            controller.itemNumberRemove(
                                                item); // Pass the item
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                        RoundedIconBtn(
                                          icon: const Icon(Icons.add),
                                          size: 30,
                                          color: Colors.white,
                                          onPressed: () {
                                            controller.itemNumberAdd(
                                                item); // Pass the item
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            bottomNavigationBar: const CheckOutCard());
      },
    );
  }
}
