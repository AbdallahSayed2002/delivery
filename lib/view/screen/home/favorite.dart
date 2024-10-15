import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/view/widgets/home_screen/home/custom_search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/home/favorite_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/const_icon.dart';
import '../../../core/constant/const_image.dart';
import '../../../data/model/items_model.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      appBar: AppBar(
        title: const Center(child: Text('Favorites')),
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<FavoriteControllerImp>(
          builder: (controller) => ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: CustomSearchButton(
                      controller: controller.searchController,
                      onChanged: (val) {
                        controller.checkSearch(val);
                      },
                    ),
                  ),
                  FutureBuilder<List<ItemsModel>>(
                          future: controller.getFavoriteItems(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenWidth * 0.6,
                                      ),
                                      Lottie.asset(AppImageAssets.noDataLottie,
                                          width: 450, height: 300),
                                    ]),
                              );
                            } else {
                              final favoriteItems = snapshot.data!;

                              return SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: favoriteItems.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 16,
                                    ),
                                    itemBuilder: (context, i) {
                                      final item = favoriteItems[i];
                                      return SizedBox(
                                        width: 140,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.goToItemDetails(item);
                                          },
                                          child: Container(
                                            color: AppColor.loginPageColor,
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: 1.02,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xFF979797)
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Hero(
                                                      tag: item.id,
                                                      child: CachedNetworkImage(
                                                        imageUrl: item.image[0],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  item.title ?? 'No Title',
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$${item.price}",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.red,
                                                          fontFamily: "sana"),
                                                    ),
                                                    GetBuilder<
                                                        FavoriteControllerImp>(
                                                      builder: (controller) =>
                                                          FutureBuilder(
                                                        future: controller
                                                            .isFavorite(
                                                                item.id),
                                                        builder: (context,
                                                            snapshot) {
                                                          final isFavorite =
                                                              snapshot.data ??
                                                                  false;
                                                          return InkWell(
                                                            onTap: () => controller
                                                                .toggleFavorite(
                                                                    item),
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6),
                                                              height: 24,
                                                              width: 24,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: isFavorite
                                                                    ? const Color(
                                                                            0xFFFF7643)
                                                                        .withOpacity(
                                                                            0.15)
                                                                    : const Color(
                                                                            0xFF979797)
                                                                        .withOpacity(
                                                                            0.1),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: SvgPicture
                                                                  .string(
                                                                AppIconAssets
                                                                    .heartIcon,
                                                                colorFilter: ColorFilter.mode(
                                                                    isFavorite
                                                                        ? const Color(
                                                                            0xFFFF4848)
                                                                        : const Color(
                                                                            0xFFDBDEE4),
                                                                    BlendMode
                                                                        .srcIn),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                ],
              )),
    );
  }
}
