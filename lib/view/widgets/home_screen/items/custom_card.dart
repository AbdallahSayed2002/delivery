import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../controller/home/items/items_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/const_icon.dart';

class CustomCard extends GetView<ItemsControllerImp> {
  final bool active;
  final VoidCallback onPressed;

  const CustomCard({
    super.key,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filteredItems.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.7,
          mainAxisSpacing: 20,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, i) {
          final item = controller.filteredItems[i];

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.02,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF979797).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Hero(
                          tag: item.id,
                          child: CachedNetworkImage(
                            imageUrl: item.image.isNotEmpty
                                ? item.image[0]
                                : 'placeholder_url', // Add null safety here
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.title ?? 'No Title', // Fallback for null title
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${item.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                            fontFamily: "sana",
                          ),
                        ),
                        GetBuilder<ItemsControllerImp>(
                          builder: (controller) => FutureBuilder(
                            future: controller.isFavorite(item.id),
                            builder: (context, snapshot) {
                              final isFavorite = snapshot.data ?? false;
                              return InkWell(
                                onTap: () => controller.toggleFavorite(item),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: isFavorite
                                        ? const Color(0xFFFF7643)
                                        .withOpacity(0.15)
                                        : const Color(0xFF979797)
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.string(
                                    AppIconAssets.heartIcon,
                                    colorFilter: ColorFilter.mode(
                                        isFavorite
                                            ? const Color(0xFFFF4848)
                                            : const Color(0xFFDBDEE4),
                                        BlendMode.srcIn),
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
    );
  }
}
