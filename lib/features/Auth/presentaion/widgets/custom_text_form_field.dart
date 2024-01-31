import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextFromField extends StatefulWidget {
  CustomTextFromField(
      {super.key,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.enabled = true,
      this.onChanged,
      this.labelText});
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? labelText;
  final void Function(String)? onChanged;
  bool? obscureText;
  final String? hintText;
  final double iconSize = 16;
  final Color iconColor = MyColors.primaryColor;
  bool? enabled;
  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        //inputFormatters: [],
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText!,
        decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: Icon(
              widget.prefixIcon,
              size: widget.iconSize,
              color: MyColors.primaryColor,
            ),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: widget.obscureText!
                        ? Icon(
                            Icons.visibility,
                            size: widget.iconSize,
                          )
                        : Icon(
                            Icons.visibility_off,
                            size: widget.iconSize,
                          ),
                    color: MyColors.primaryColor,
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText!;
                      });
                    },
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFF919AAB),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.primaryColor))),
      ),
    );
  }
}
