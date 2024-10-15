import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class CustomErrorDialog extends StatelessWidget {
  final String text;
  final Widget? button;

  const CustomErrorDialog({super.key, required this.text, this.button});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFFE6E6),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/false.png', height: 250),
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
          if (button != null) button!,  // Only display the button if it's not null
        ],
      ),
    );
  }
}

class ErrorButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const ErrorButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: 120,
          child: ElevatedButton(
            onPressed: onPressed,  // This is now correct
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              backgroundColor: AppColor.buttonColor,
            ),
            child: Text(
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
    );
  }
}
