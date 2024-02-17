import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/helpers.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/food_items_grid_view.dart';
import 'package:foody/features/layout/home/presentaion/view_model/food_cubit/food_cubit.dart';

class AllRecipesView extends StatelessWidget {
  const AllRecipesView({Key? key}) : super(key: key);
  static String id = '/AllRecipesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'All Recipes',
          style: Styles.textStyle20.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            navigateToHome(context);
          },
        ),
      ),
      body: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, state) {
          if (state is FoodSucess) {
            return FoodItemsGridView(
              foodModels: state.foodModels,
            );
          } else if (state is FoodFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
