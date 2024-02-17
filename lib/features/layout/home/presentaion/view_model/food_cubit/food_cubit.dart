import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';
import 'package:foody/features/layout/home/data/repos/home_repo.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final HomeRepo homeRepo;
  FoodCubit(this.homeRepo) : super(FoodInitial());
  fetchFoodItems() async {
    emit(Foodlodinag());
    var result = await homeRepo.fetchFoodItems();
    print('////////////////////////////////////////////');
    result.fold(
        (failure) => emit(FoodFailure(errorMessage: failure.errorMessage)),
        (foodModels) => emit(FoodSucess(foodModels: foodModels)));
    print('////////////////////////////////////////////');
  }
}
