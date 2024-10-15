import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../controller/home/items/item_details_controller.dart';

class SmallItemImage extends StatelessWidget {
  const SmallItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.item!.image.length,
          (index) => GestureDetector(
            onTap: () {
              controller.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
              controller.onImageChanged(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(8),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.blue
                        .withOpacity(controller.currentImageIndex == index ? 1 : 0)),
              ),
              child: CachedNetworkImage(imageUrl:controller.item!.image[index]),
            ),
          ),
        ),
      ),
    );
  }
}
