import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FoodShimmer extends StatelessWidget {
  const FoodShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 190,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Positioned(
            bottom: 2,
            left: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  ShimmerSkeleton(width: 100),
                  SizedBox(height: 5),
                  ShimmerSkeleton(width: 50),
                  SizedBox(height: 5),
                  ShimmerSkeleton(width: 200)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({
    super.key,
    required this.width,
    this.height = 10,
  });
  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
     baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black),
      ),
    );
  }
}
