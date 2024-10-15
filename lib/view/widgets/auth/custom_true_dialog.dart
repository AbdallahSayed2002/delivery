import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomTrueDialog extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function()? onPressed;

  const CustomTrueDialog({
    super.key,
    required this.text,
    this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/done.png', height: 250),
          const SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: AppColor.buttonColor,
              ),
              child: Text(
                textAlign:TextAlign.center ,
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
