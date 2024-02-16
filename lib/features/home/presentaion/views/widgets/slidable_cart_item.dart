import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foody/features/home/data/models/food_model/food_model.dart';
import 'package:foody/features/home/presentaion/view_model/cart_cubit/cart_cubit.dart';
import 'package:foody/features/home/presentaion/views/widgets/cart_item.dart';

class SlidableCartItem extends StatelessWidget {
  const SlidableCartItem({
    super.key,
    required this.foodModel,
    required this.index,
  });
  final FoodModel foodModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          BlocProvider.of<CartCubit>(context).delete(foodModel, index);
          BlocProvider.of<CartCubit>(context).isEmpty();
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              BlocProvider.of<CartCubit>(context).delete(foodModel, index);
              BlocProvider.of<CartCubit>(context).isEmpty();
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      child: CartItem(
        foodModel: foodModel,
      ),
    );
  }
}
