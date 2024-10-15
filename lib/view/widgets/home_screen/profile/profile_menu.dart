import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    required this.iconColor,
    required this.color,
    this.secondIconColor = Colors.white,
  });

  final String text;
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "sana",
                ),
              ),
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
