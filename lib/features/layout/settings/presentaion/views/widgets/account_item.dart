import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/constants/my_colors.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/Auth/presentaion/view_models/cubit/auth_cubit.dart';
import 'package:foody/features/layout/settings/presentaion/views/widgets/small_button.dart';

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
            child: Image.network(
              BlocProvider.of<AuthCubit>(context).googleUser?.photoUrl ??
                  'https://cdn-icons-png.flaticon.com/512/9131/9131529.png',
              height: 80,
            )),
        const Spacer(
          flex: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              BlocProvider.of<AuthCubit>(context).googleUser?.displayName?? 'mohamed abdlmaboud',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600, color: MyColors.kTextColor),
            ),
            SizedBox(
              width: 200,
              child: Text(
                BlocProvider.of<AuthCubit>(context).googleUser?.email ??'',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
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
