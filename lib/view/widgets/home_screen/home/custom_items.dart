import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/items_model.dart';

class CustomItems extends GetView<HomeControllerImp> {
  const CustomItems({super.key});

  @override
  Widget build(BuildContext context) {
    // Shuffle the items to create a randomized order
    List<ItemsModel> shuffledItems = List.from(controller.items);
    shuffledItems.shuffle(Random());

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, i) => const SizedBox(width: 30),
        itemCount: shuffledItems.length, // Use shuffledItems length
        itemBuilder: (context, i) {
          final item = shuffledItems[i]; // Get the current shuffled item
          return InkWell(
            onTap: () {
              controller.goToItemDetails(item); // Pass the selected item to details
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Hero(
                    tag: item.id, // Use the shuffled item's id as the tag
                    child: CachedNetworkImage(
                      imageUrl: item.image[0],
                      height: 100,
                      width: 150,
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(color: Colors.blue),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: Text(
                    item.name!, // Ensure item's name is not null
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
