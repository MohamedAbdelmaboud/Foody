import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/home/data/models/food_model/food_model.dart';
import 'package:foody/features/home/presentaion/view_model/favourite_cubit/favourite_cubit.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.foodModel,
  });

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<FavouriteCubit>(context).addFavourite(foodModel);
        foodModel.isFavourite=true;
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            return Icon(
              foodModel.isFavourite
                  ? Icons.favorite_outlined
                  : Icons.favorite_outline_sharp,
              size: 20,
              color: foodModel.isFavourite ? Colors.red : Colors.black,
            );
          },
        ),
      ),
    );
  }
}
