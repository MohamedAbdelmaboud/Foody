import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(milliseconds: 1000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 20,
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError ? Colors.red : Colors.green,
      clipBehavior: Clip.none,
      content: Center(
        child: Text(
          text,
        ),
      ),
    ),
  );
}
