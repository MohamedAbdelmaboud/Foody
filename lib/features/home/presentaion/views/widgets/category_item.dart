import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/data/models/category_model.dart';


class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff5f4f5),
      ),
      height: 35,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            categoryModel.imagePath,
            height: 30,
          ),
          Text(
            categoryModel.text,
            style: Styles.textStyle14.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
