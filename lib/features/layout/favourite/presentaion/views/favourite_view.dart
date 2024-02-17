import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/utlis/helpers.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/core/widgets/food_items_grid_view.dart';
import 'package:foody/features/layout/favourite/presentaion/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:foody/features/layout/favourite/presentaion/view_model/favourite_cubit/favourite_state.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);
  static String id = 'FavouriteView';
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        navigateToHome(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'My favourites',
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
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
          if (state is FavouriteSucess) {
            return FoodItemsGridView(
              foodModels: state.foodModels,
            );
          }
          return Center(
            child: Image.asset(
              'assets/images/Like3.jpg',
              height: 200,
            ),
          );
        }),
      ),
    );
  }
}
