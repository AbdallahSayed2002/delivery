import 'package:delivery/core/constant/const_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../controller/home/items/item_details_controller.dart';
import '../../../widgets/home_screen/items/item_details/color_option.dart';
import '../../../widgets/home_screen/items/item_details/custom_bottom_navigationBar.dart';
import '../../../widgets/home_screen/items/item_details/custom_itemDetails_image.dart';
import '../../../widgets/home_screen/items/item_details/item_dec.dart';
import '../../../widgets/home_screen/items/item_details/rounded_icon_btn.dart';
import '../../../widgets/home_screen/items/item_details/small_item_image.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      "${controller.item!.rating}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "sana",
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.string(AppIconAssets.starIcon),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          const CustomItemDetailsImage(),
          const SmallItemImage(),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const ItemDec(),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GetBuilder<ItemDetailsControllerImp>(
                          builder: (controller) => Row(
                            children: [
                              ColorOption(
                                color: Colors.red,
                                isSelected: controller.selectedColor == "Red",
                                onTap: () => controller.selectedColor = "Red",
                              ),
                              ColorOption(
                                color: Colors.green,
                                isSelected: controller.selectedColor == "Green",
                                onTap: () => controller.selectedColor = "Green",
                              ),
                              ColorOption(
                                color: Colors.orange,
                                isSelected:
                                    controller.selectedColor == "Orange",
                                onTap: () =>
                                    controller.selectedColor = "Orange",
                              ),
                              const Spacer(),
                              RoundedIconBtn(
                                icon: const Icon(Icons.remove),
                                size: 50,
                                color: Colors.white,
                                onPressed: () {
                                  controller
                                      .itemNumberRemove(); // Decrease quantity
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "${controller.item?.quantity ?? 1}",
                                  // Display quantity or default to 1 if null
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 22,
                                    fontFamily: "sana",
                                  ),
                                ),
                              ),
                              RoundedIconBtn(
                                icon: const Icon(Icons.add),
                                size: 50,
                                color: Colors.white,
                                showShadow: true,
                                onPressed: () {
                                  controller
                                      .itemNumberAdd(); // Increase quantity
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<ItemDetailsControllerImp>(
        builder: (controller) {
          return FutureBuilder<bool>(
            future: controller.isAdded(controller.item!.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show loading indicator
              } else if (snapshot.hasError) {
                return Text(
                    'Error: ${snapshot.error}'); // Display error message
              }

              final isAdded = snapshot.data ?? false;

              return CustomBottomNavigationBar(
                text: isAdded ? "Remove from cart" : "Add to cart",
                onPressed: () {
                  controller.toggleCart(controller.item!);
                },
                containerColor: Colors.white,
                buttonColor: isAdded ? Colors.red : Colors.lightBlue,
              );
            },
          );
        },
      ),
    );
  }
}
