part of 'favourite_cubit.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteSucess extends FavouriteState {
  final List<FoodModel> foodModels;

  FavouriteSucess({required this.foodModels});
}

final class FavouriteEmpty extends FavouriteState {}
