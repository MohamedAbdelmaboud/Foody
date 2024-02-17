import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/layout/favourite/presentaion/view_model/favourite_cubit/favourite_state.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';


class FavouriteCubit extends Cubit<FavouriteState> {
  List<FoodModel> foodModels = [];
  FavouriteCubit() : super(FavouriteInitial());
  addFavourite(FoodModel foodModel) {
    if (foodModels.isEmpty) {
      emit(FavouriteEmpty());
    }
    foodModels.add(foodModel);
    emit(FavouriteSucess(foodModels: foodModels));
  }
}
