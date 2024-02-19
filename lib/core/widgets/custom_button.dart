import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/themes/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  final Color? backgroundColor;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.backgroundColor = MyColors.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: backgroundColor,
            elevation: 10,
            fixedSize: Size(MediaQuery.of(context).size.width, 40)),
        child: isLoading
            ? const SpinKitDualRing(
                color: Colors.white,
                lineWidth: 2,
                size: 30,
              )
            : Text(
                text,
                style: Styles.textStyle18,
              ));
  }
}
