
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteSucess extends FavouriteState {
  final List<FoodModel> foodModels;

  FavouriteSucess({required this.foodModels});
}

final class FavouriteEmpty extends FavouriteState {}
