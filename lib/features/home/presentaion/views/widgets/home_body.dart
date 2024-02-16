import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/data/models/category_model.dart';
import 'package:foody/features/home/presentaion/view_model/food_cubit/food_cubit.dart';
import 'package:foody/features/home/presentaion/views/all_products_view.dart';
import 'package:foody/features/home/presentaion/views/widgets/custom_container.dart';
import 'package:foody/features/home/presentaion/views/widgets/home_app_bar.dart';
import 'package:foody/features/home/presentaion/views/widgets/serach_field.dart';

import 'category_item.dart';
import 'trending_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Column(
                  children: [
                    HomeAppBar(),
                    SizedBox(
                      height: 10,
                    ),
                    SerachField(),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: -80,
              child: CustomContainer(),
            ),
          ],
        ),
        const SizedBox(
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Styles.textStyle20.copyWith(color: Colors.black),
                  ),
                  Text(
                    'See All',
                    style: Styles.textStyle12.copyWith(
                      color: MyColors.primaryColor,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryItem(
                        categoryModel: categories[index],
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Recipes',
                    style: Styles.textStyle20.copyWith(color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AllRecipesView.id);
                    },
                    child: Text(
                      'View All',
                      style: Styles.textStyle12
                          .copyWith(color: MyColors.primaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<FoodCubit, FoodState>(
                builder: (context, state) {
                  if (state is FoodSucess) {
                    return TrendingListView(
                      foodModels: state.foodModels,
                    );
                  } else if (state is FoodFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else
                    return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
