import 'package:flutter/material.dart';

class CustomLanguageButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final void Function()? onTap;

  const CustomLanguageButton({super.key, required this.text, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(130),color: color),
        child: Center(child: Text(text!,style: Theme.of(context).textTheme.displayLarge)),
      ),
    );
  }
}
