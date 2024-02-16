part of 'food_cubit.dart';

class FoodState {}

final class FoodInitial extends FoodState {}

final class Foodlodinag extends FoodState {}

final class FoodSucess extends FoodState {
  final List<FoodModel> foodModels;

  FoodSucess({required this.foodModels});
}

final class FoodFailure extends FoodState {
  final String errorMessage;

  FoodFailure({required this.errorMessage});
}
