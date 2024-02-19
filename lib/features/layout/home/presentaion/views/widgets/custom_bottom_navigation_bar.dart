import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/themes/styles.dart';
import 'package:foody/core/widgets/shake_widget.dart';
import 'package:foody/core/widgets/show_snack_bar.dart';
import 'package:foody/features/layout/cart/presentaion/view_model/cart_cubit/cart_cubit.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.isShaking,
    required this.foodModel,
  });
  final bool isShaking;
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<CartCubit>(context).addToCart(foodModel);
              showSnackBar(context, 'Added to Cart !', false);
            },
            child: ShakeWidget(
                isShaking: isShaking, child: const CustomContainer()),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.favorite_outline_sharp,
              size: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final bool isLoading;

  const CustomContainer({
    super.key,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 48, 138).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: MyColors.primaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isLoading
          ? const SpinKitDualRing(
              color: Colors.white,
              lineWidth: 2,
              size: 30,
            )
          : Text(
              'Add to Cart',
              style: Styles.textStyle16
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
    );
  }
}
