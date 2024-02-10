import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
      ),
    );
  }
}
