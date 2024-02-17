import 'package:dartz/dartz.dart';
import 'package:foody/core/utlis/failures.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<FoodModel>>> fetchFoodItems();
  Future<Either<Failure,FoodModel>> fetchFoodDetails();
}
