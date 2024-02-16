import 'package:flutter/material.dart';
import 'package:foody/core/utlis/random.dart';
import 'package:foody/features/home/data/models/food_model/food_model.dart';
import 'package:foody/features/home/presentaion/views/widgets/food_item.dart';

import 'food_shimmer.dart';

class TrendingListView extends StatelessWidget {
  const TrendingListView({
    super.key,
    this.foodModels,
    this.shimmer = false,
  });
  final List<FoodModel>? foodModels;
  final bool shimmer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return shimmer
              ? const FoodShimmer()
              : FoodItem(
                  foodModel: foodModels![index + 5],
                  incredients: generateRandomIngredientsNum(),
                  time: generateRandomTime(),
                );
        },
      ),
    );
  }
}
