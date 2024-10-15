import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/items/items_controller.dart';
import '../../../../data/datasource/static/static.dart';

class ItemsCategories extends GetView<ItemsControllerImp> {
  const ItemsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(width: 40),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (){
              controller.changeCat(i);
            },
            child: Column(
              children: [
                Text(
                  categoriesList[i].name!,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                GetBuilder<ItemsControllerImp>(
                  builder: (controller) => Container(
                    height: 6,
                    width: 75,
                    decoration: controller.selectedCat == i
                        ? BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          )
                        : null,
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
