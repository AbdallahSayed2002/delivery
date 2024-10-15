import 'package:flutter/material.dart';

class CustomButtonSkip extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButtonSkip({super.key,required this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black45),textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
