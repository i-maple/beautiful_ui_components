import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  const FilledButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.onTap,
      required this.textColor})
      : super(key: key);

  final Color color;
  final String text;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
