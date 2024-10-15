import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class CustomChangePageText extends StatelessWidget {
  const CustomChangePageText({super.key, required this.text1, required this.text2, this.onTap});
  final String text1;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.grey[700]),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
              text2,
              style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: AppColor.primaryColor)
          ),
        ),
      ],
    );
  }
}
