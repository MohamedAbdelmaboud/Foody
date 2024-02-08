import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/custom_button.dart';

import 'widgets/cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);
  static String id = '/CartView';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f4f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'My cart',
          style: Styles.textStyle20.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),

              child: const Column(
                children: [
                  CartItem(),
                  SizedBox(
                    height: 10,
                  ),
                  CartItem(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: BottomSheet(
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
                            style: Styles.textStyle14
                                .copyWith(color: Colors.black),
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
      ),
    );
  }
}
