import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foody/core/utlis/api_service.dart';
import 'package:foody/core/utlis/failures.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';
import 'package:foody/features/layout/home/data/repos/home_repo.dart';

class HomeRepoImplmentaion implements HomeRepo {
  ApiService apiService;
  HomeRepoImplmentaion({required this.apiService});

  @override
  Future<Either<Failure, FoodModel>> fetchFoodDetails({int? id}) async {
    try {
      Map<String, dynamic> json = await apiService.fetchFood(
          baseUrl: 'https://the-vegan-recipes-db.p.rapidapi.com/$id');
      FoodModel foodModel = FoodModel.fromJson(json);
      return right(foodModel);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    }
  }

  @override
  Future<Either<Failure, List<FoodModel>>> fetchFoodItems() async {
    try {
      List json = await apiService.fetchFood(baseUrl:'https://the-vegan-recipes-db.p.rapidapi.com');
      List<FoodModel> foodModels = List.generate(
          json.length, (index) => FoodModel.fromJson(json[index]));
      return right(foodModels);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    }
  }
}
