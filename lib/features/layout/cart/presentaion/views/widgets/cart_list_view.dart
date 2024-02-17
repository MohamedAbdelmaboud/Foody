import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/layout/cart/presentaion/view_model/cart_cubit/cart_cubit.dart';
import 'package:foody/features/layout/cart/presentaion/views/widgets/slidable_cart_item.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.foodModels,
  });
  final List<FoodModel> foodModels;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: BlocProvider.of<CartCubit>(context).foodModels.length,
        itemBuilder: (BuildContext context, int index) {
          return SlidableCartItem(
            foodModel: foodModels[index],
            index: index,
          );
        },
      ),
    );
  }
}
