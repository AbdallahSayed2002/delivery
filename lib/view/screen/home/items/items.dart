import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/items/items_controller.dart';
import '../../../../routes_name.dart';
import '../../../widgets/home_screen/home/custom_search_button.dart';
import '../../../widgets/home_screen/items/custom_card.dart';
import '../../../widgets/home_screen/items/items_categories.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) {
            return ListView(
              children: [
                CustomSearchButton(
                  controller: controller.searchController,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                controller.isSearch
                    ? const ItemsCategories()
                    :const ItemsCategories(),
                CustomCard(active: false, onPressed: (){})
              ],
            );
          },
        ),
      ),
    );
  }
}
