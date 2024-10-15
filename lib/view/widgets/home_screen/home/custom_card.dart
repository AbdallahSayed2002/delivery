import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomCardHome({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          alignment: Alignment.center,
          height: 160,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 160,
            width: 140,
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(180),
                bottomLeft: Radius.circular(180),
                topRight: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
