import 'package:delivery/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/static/static.dart';

class CustomCategories extends GetView<HomeControllerImp> {
  const CustomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(width: 25),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, i){
          return InkWell(
            onTap: () {
              controller.goItems(controller.categories, i);
            },
            child: Stack(
              children: [
                SizedBox(
                  height: 110,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: SvgPicture.asset(
                          categoriesList[i].image!,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        categoriesList[i].name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 85,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
