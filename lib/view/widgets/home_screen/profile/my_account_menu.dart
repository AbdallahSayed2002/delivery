import 'package:flutter/material.dart';

class MyAccountMenu extends StatelessWidget {
  const MyAccountMenu({
    super.key,
    required this.text,  // Change type to Widget
    required this.icon,
    this.onPressed,
    required this.iconColor,
    required this.color,
    this.secondIconColor = Colors.white,
  });

  final Widget text;  // Change type from String? to Widget
  final Color? iconColor;
  final Color color;
  final IconData icon;
  final Color? secondIconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey[800],
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: text,  // Display Widget instead of String directly
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: secondIconColor,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

// TextStyle(
// color: textColor,
// fontWeight: FontWeight.bold,
// fontSize: 16,
// fontFamily: "sana",