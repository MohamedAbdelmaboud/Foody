import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';

import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/food_stack.dart';
import 'widgets/ingredients_item.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);
  static String id = '/DetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FoodStack(),
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
                        text: ingredients[index],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {},
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
}

List<String> ingredients = [
  "2 tbsp vegetable oil",
  "1 tsp mustard seeds",
  "1 tsp chana dal",
  "½ tsp white urad dal",
  "10-12 fresh curry leaves",
  "½ tsp ground turmeric",
  "Juice 2 lemons",
  "1 tsp salt",
  "½ tsp sugar (optional)",
  "400g (cooked weight) cooked and cooled basmati rice"
];
