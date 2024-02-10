import 'package:flutter/material.dart';
import 'package:foody/core/utlis/helpers.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/presentaion/views/widgets/my_bottom_sheet.dart';

import 'widgets/slidable_cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);
  static String id = '/CartView';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        navigateToHome(context);
      },
      child: Scaffold(
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
              navigateToHome(context);
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return const SlidableCartItem();
                    },
                  ),
                ),
                const MyBottomSheet(),
              ],
            )),
      ),
    );
  }
}
