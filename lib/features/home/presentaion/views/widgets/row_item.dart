import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';

class RowItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const RowItem({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(text, style: Styles.textStyle12),
        ],
      ),
    );
  }
}
