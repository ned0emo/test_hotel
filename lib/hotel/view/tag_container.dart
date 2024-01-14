import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final IconData? iconData;
  final String text;
  final Color textColor;
  final Color backColor;

  const TagContainer({
    super.key,
    required this.text,
    required this.textColor,
    required this.backColor,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconData == null ? const SizedBox() : Icon(iconData, color: textColor),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
