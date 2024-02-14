import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/custom_button.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      showDragHandle: false,
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 55,
                  child: TextField(
                    cursorHeight: 25,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xfff5f4f5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Enter Discount code',
                      hintStyle: Styles.textStyle14.copyWith(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.w400),
                      suffix: TextButton(
                        onPressed: () {
                          setState(() {
                            visible = true;
                          });
                        },
                        child: Text(
                          'Apply',
                          style:
                              Styles.textStyle14.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SubTotal'),
                    Text(r'$255'),
                  ],
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    Text(r'$255'),
                  ],
                ),
                Visibility(
                  visible: visible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'save 50%',
                        style: Styles.textStyle12.copyWith(color: Colors.red),
                      ),
                      Text(
                        r'$255',
                        style: Styles.textStyle12
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
                CustomButton(text: 'Checkout', onPressed: () {})
              ],
            ),
          ),
        );
      },
    );
  }
}
