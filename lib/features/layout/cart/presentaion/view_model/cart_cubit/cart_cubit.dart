import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<FoodModel> foodModels = [];
  addToCart(FoodModel foodModel) {
    foodModels.add(foodModel);
    emit(CartSucess(foodModels: foodModels));
  }

  delete(FoodModel foodModel, int index) {
    foodModels.removeAt(index);
    emit(CartSucess(foodModels: foodModels));
  }

  isEmpty() {
    if (foodModels.isEmpty) {
      emit(CartEmpty());
    }
  }
}
