import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../controller/home/items/item_details_controller.dart';
import '../../../../../core/constant/const_icon.dart';

class ItemDec extends GetView<ItemDetailsControllerImp> {
  const ItemDec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title of the item
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "${controller.item!.title}",
            style: const TextStyle(fontSize: 24),
          ),
        ),

        // Price and favorite icon row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Text(
                '\$${controller.item!.price}',
                style: const TextStyle(
                  fontSize: 26,
                  fontFamily: "sana",
                  color: Colors.red,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GetBuilder<ItemDetailsControllerImp>(
                builder: (controller) => FutureBuilder<bool>(
                  future: controller.isFavorite(controller.item!.id),
                  builder: (context, snapshot) {
                    final isFavorite = snapshot.data ?? false;
                    return InkWell(
                      onTap: () => controller.toggleFavorite(controller.item!),
                      child: AnimatedScale(
                        scale: isFavorite ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 48,
                          decoration: BoxDecoration(
                            color: isFavorite
                                ? const Color(0xFFFFE6E6)
                                : const Color(0xFFF5F6F9),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: SvgPicture.string(
                            AppIconAssets.heartIcon,
                            colorFilter: ColorFilter.mode(
                              isFavorite
                                  ? const Color(0xFFFF4848)
                                  : const Color(0xFFDBDEE4),
                              BlendMode.srcIn,
                            ),
                            height: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // Item description with height animation
        GetBuilder<ItemDetailsControllerImp>(
          builder: (controller) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.only(left: 20, right: 64),
            height: controller.currentLines == 2 ? 50 : null,
            // Height adjusts based on line expansion
            child: Text(
              "${controller.item!.dec}",
              maxLines: controller.currentLines,
              overflow: TextOverflow.ellipsis, // Keep ellipsis for 2-line state
            ),
          ),
        ),
        // "See more/less" toggle with animated icon rotation
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GetBuilder<ItemDetailsControllerImp>(
            builder: (controller) => GestureDetector(
              onTap: () {
                controller.detailChange();
              },
              child: Row(
                children: [
                  Text(
                    controller.text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.blue),
                  ),
                  const SizedBox(width: 5),
                  AnimatedRotation(
                    turns: controller.currentLines == 2 ? 0 : 0.5,
                    // Rotate the icon 180 degrees
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      controller.icon,
                      size: 12,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
