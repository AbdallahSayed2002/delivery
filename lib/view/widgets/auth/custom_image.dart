import 'package:flutter/material.dart';

import '../../../core/constant/const_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Image.asset(
        AppImageAssets.loginImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
