import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    required this.icon,
    required this.onPressed,
    this.showShadow = false, required this.color, required this.size,
  });

  final Icon icon;
  final Color? color;
  final GestureTapCancelCallback onPressed;
  final bool showShadow;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: size*4,
              color: const Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          foregroundColor: Colors.black,
          padding: EdgeInsets.zero,
          backgroundColor: color,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
