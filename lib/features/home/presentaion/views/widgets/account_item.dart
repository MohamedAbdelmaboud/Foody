import 'package:flutter/material.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/home/presentaion/views/widgets/small_button.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Image.asset(
              'assets/images/me.jpg',
              height: 50,
            )),
        const Spacer(
          flex: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohamed Abdlmaboud',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600, color: MyColors.kTextColor),
            ),
            Text(
              'personal info',
              style: Styles.textStyle12.copyWith(color: Colors.grey),
            ),
          ],
        ),
        const Spacer(
          flex: 2,
        ),
        const SmallButton(
          iconData: Icons.arrow_forward_ios,
        )
      ],
    );
  }
}
