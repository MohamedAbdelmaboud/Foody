import 'package:foody/core/constants/assets.dart';

class CategoryModel {
  final String imagePath;
  final String text;

  CategoryModel({
    required this.imagePath,
    required this.text,
  });
}

List<CategoryModel> categories = [
  CategoryModel(
    imagePath: Assets.assetsImagesMain,
    text: 'Main',
  ),
  CategoryModel(
    imagePath: Assets.assetsImagesFish,
    text: 'Fish',
  ),
  CategoryModel(
    imagePath: Assets.assetsImagesPizza,
    text: 'Pizza',
  ),
  CategoryModel(
    imagePath: Assets.assetsImagesSweets,
    text: 'Sweets',
  ),

  CategoryModel(
    imagePath: Assets.assetsImagesSalad,
    text: 'Salad',
  ),

  // Add more categories as needed
];
