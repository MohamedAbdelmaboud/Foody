import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    this.isFavourite = false,
  });
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
              fit: BoxFit.cover,
              height: 250,
              width: 200,
              'https://apipics.s3.amazonaws.com/vegan_api/16.jpg'),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xffffffff),
                  const Color(0xffffffff).withOpacity(.1),
                  const Color(0xffffffff).withOpacity(.0),
                ]),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          bottom: 2,
          left: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    'Easy rhubarb cordial',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle12.copyWith(
                        height: 1,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '9 incredients | 35 min',
                  style: Styles.textStyle12.copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
            child: Icon(
              isFavourite
                  ? Icons.favorite_outlined
                  : Icons.favorite_outline_sharp,
              size: 20,
              color: isFavourite ? Colors.red : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
