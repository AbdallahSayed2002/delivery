import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../items/item_details/rounded_icon_btn.dart';

class CustomSearchButton extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController controller;

  const CustomSearchButton({
    super.key,
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: Colors.blue,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40),
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.blue,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 6),
          RoundedIconBtn(
            icon: const Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Colors.black54,
            ),
            size: 50,
            color: Colors.grey[200],
            onPressed: () => Get.toNamed(AppRoutes.notification),
          ),
        ],
      ),
    );
  }
}
