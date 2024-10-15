import 'package:flutter/material.dart';
import 'package:delivery/core/constant/colors.dart';

class CustomOnBoardingButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomOnBoardingButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttonColor),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}