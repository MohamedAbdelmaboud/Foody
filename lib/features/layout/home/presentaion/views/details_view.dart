import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foody/core/utlis/random.dart';
import 'package:foody/core/themes/styles.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/food_stack.dart';
import 'widgets/ingredients_item.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key, required this.foodModel}) : super(key: key);
  static String id = '/DetailsView';
  final FoodModel foodModel;
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    FToast().init(context);
  }

  bool isShaking = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        isShaking: isShaking,
        foodModel: widget.foodModel,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FoodStack(
            foodModel: widget.foodModel,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 20, top: 50),
            child: Column(
              children: [
                const Text(
                    'Vivek Singh’s delicious lemon basmati rice is an easy, flavour-packed side dish – perfect for an Indian feast! Pair it with this succulent lamb shank curry for the ultimate takeaway at home.'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Ingredients',
                      style: Styles.textStyle20.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return IngredientsItem(
                        text: generateRandomIngredients()[index],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShaking = true;
                    });

                    showFtoast();
                    Future.delayed(const Duration(milliseconds: 600), () {
                      setState(() {
                        isShaking = false;
                      });
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.cyan.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      'Show the cooking methods',
                      style: Styles.textStyle12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void showFtoast() {
    FToast().showToast(
      isDismissable: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.red,
        ),
        child: Text(
          "Add it to cart first !",
          style: Styles.textStyle14.copyWith(color: Colors.white),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
