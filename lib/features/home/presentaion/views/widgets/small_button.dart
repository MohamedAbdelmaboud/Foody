import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.iconData,
  });
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        iconData,
        size: 25,
      ),
    );
  }
}
