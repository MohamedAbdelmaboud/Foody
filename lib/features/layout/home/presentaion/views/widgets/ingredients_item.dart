import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';

class IngredientsItem extends StatelessWidget {
  final String text;

  const IngredientsItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.track_changes_rounded,
          size: 19,
          color: Colors.cyan.shade300,
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 200,
          child: Text(
            text,
            style: Styles.textStyle14.copyWith(color: Colors.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
