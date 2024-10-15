import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/controller/home/home_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/home_screen/home/custom_card.dart';
import '../../widgets/home_screen/home/custom_categories.dart';
import '../../widgets/home_screen/home/custom_items.dart';
import '../../widgets/home_screen/home/custom_search_button.dart';
import '../../widgets/home_screen/home/custom_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: GetBuilder<HomeControllerImp>(
            builder: (controller) => ListView(
              children: [
                CustomSearchButton(
                  controller: controller.searchController,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                controller.isSearch
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredItems.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[800],
                                padding: const EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                controller.goToItemDetails(controller.filteredItems[i]);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 80,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF979797)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Hero(
                                      tag: controller.filteredItems[i].id,
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .filteredItems[i].image[0],
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    "${controller.filteredItems[i].name}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Column(
                        children: [
                          CustomCardHome(title: "TV", subtitle: "Cashback 20%"),
                          CustomTitleHome(title: "Categories"),
                          CustomCategories(),
                          CustomTitleHome(title: "Product for you"),
                          CustomItems(),
                          CustomTitleHome(title: "Offer"),
                          CustomItems(),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
