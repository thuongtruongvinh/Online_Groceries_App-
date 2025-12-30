import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';
import 'package:groceries_app/presentation/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomeScreenView();
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map<String, String>;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(child: _buildBody(context, data)),
    );
  }

  Center _buildBody(BuildContext context, data) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
              SvgPicture.asset(Assets.icon.icCarrotColor.path, width: 30),
              SizedBox(height: context.screenHeight * 8 / 896),
              AppText(
                text: data['zone'] ?? 'Dhaka, Bangladesh',
                style: AppTextStyle.tsSemiBoldNearBlack18,
              ),
              SizedBox(height: context.screenHeight * 20 / 896),
              _buildSearchField(context),
              SizedBox(height: context.screenHeight * 20 / 896),
              _banner(context),
              SizedBox(height: context.screenHeight * 30 / 896),
              _buildTextandViewAll(context),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTextandViewAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: 'Exclusive Offer',
          style: AppTextStyle.tsSemiBoldBlackPurple24,
        ),
        AppText(
          text: 'View All',
          style: AppTextStyle.tsSemiBoldmintGreen16,
        ),
      ],
    );
  }

  CarouselSlider _banner(BuildContext context){
    final List<String> imgList = [
      Assets.img.imgBanner1.path,
      Assets.img.imgBanner2.path,
      Assets.img.imgBanner3.path,
    ];
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: context.screenHeight * 115 / 896, autoPlay: true),
      
      items: imgList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              
            );
          },
        );
      }).toList(),
    );
  }

  TextField _buildSearchField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search Store',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.grayGreen,
      ),
    );
  }
}
