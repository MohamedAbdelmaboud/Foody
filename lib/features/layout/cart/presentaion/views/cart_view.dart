import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/core/constants/assets.dart';
import 'package:foody/core/utlis/helpers.dart';
import 'package:foody/core/themes/styles.dart';
import 'package:foody/features/layout/cart/presentaion/view_model/cart_cubit/cart_cubit.dart';
import 'package:foody/features/layout/cart/presentaion/views/widgets/my_bottom_sheet.dart';

import 'widgets/cart_list_view.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);
  static String id = '/CartView';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
        backgroundColor: const Color(0xfff5f4f5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'My cart',
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
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                  if (state is CartSucess) {
                    return CartListView(
                      foodModels: state.foodModels,
                    );
                  } else {
                    return Center(
                      child: SvgPicture.asset(
                        Assets.assetsImagesAddtoCart,
                        height: 600,
                      ),
                    );
                  }
                }),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return const MyBottomSheet();
                  },
                ),
              ],
            )),
      ),
    );
  }
}
