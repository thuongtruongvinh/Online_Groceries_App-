import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/screens/profile_screen/widgets/list_card_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

import 'package:groceries_app/presentation/theme/app_colors.dart';
import 'package:groceries_app/presentation/theme/app_textstyle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(child: _buildBody(context)),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 69 / 896),
          _buildAvatarAndName(context),
          SizedBox(height: context.screenHeight * 50 / 896),
          _buildListCard(),
          SizedBox(height: context.screenHeight * 72 / 896),
          AppButton(text: 'Log Out', color: AppColors.grayGreen, prexixIcon: true, onTap: () {}),
        ],
      ),
    );
  }

  Row _buildAvatarAndName(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(Assets.img.imgAvatar.path),
        ),
        SizedBox(width: context.screenWidth * 16 / 414),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: AppTextStyle.tsSemiBoldNearBlack18.copyWith(height: 1.0),
                ),
                SizedBox(width: context.screenWidth * 8 / 414),
                SvgPicture.asset(Assets.icon.icPencill.path,),
              ],
            ),
            Text(
              'johndoe@example.com',
              style: AppTextStyle.tsSemiboldNeutralGray14.copyWith(height: 1.0),
            ),
          ],
        )
      ],
    );
  }

  ListCardWidget _buildListCard() {
    return ListCardWidget(items: [
      ListItem(title: 'Orders', iconPath: Assets.icon.icOrder.path),
      ListItem(title: 'My Details', iconPath: Assets.icon.icIdCard.path),
      ListItem(title: 'Delivery Address', iconPath: Assets.icon.icLocation.path),
      ListItem(title: 'Payment Methods', iconPath: Assets.icon.icCreditcard.path),
      ListItem(title: 'Promo Code', iconPath: Assets.icon.icPromo.path),
      ListItem(title: 'Notifications', iconPath: Assets.icon.icBell.path),
      ListItem(title: 'Help', iconPath: Assets.icon.icQuestion.path),
      ListItem(title: 'About', iconPath: Assets.icon.icAbout.path),
    ]);
  }
}



