part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}


final class CartSucess extends CartState {
  final List<FoodModel> foodModels;

  CartSucess({required this.foodModels});
}

final class CartEmpty extends CartState {}
