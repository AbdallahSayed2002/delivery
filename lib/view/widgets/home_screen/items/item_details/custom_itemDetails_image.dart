import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../controller/home/items/item_details_controller.dart';

class CustomItemDetailsImage extends StatelessWidget {
  const CustomItemDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            Hero(
              tag: controller.item!.id,
              child: SizedBox(
                width: 250,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.item!.image.length,
                    onPageChanged: (index) => controller.onImageChanged(index),
                    itemBuilder: (context, index) {
                      return Transform(
                        transform: Matrix4.identity()..translate(0.0),
                        child: CachedNetworkImage(
                          imageUrl: controller.item!.image[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
