import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';
import 'package:groceries_app/presentation/theme/app_colors.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final TextEditingController _zoneController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHeight * 120 / 896),
        Center(child: Image.asset(Assets.img.imgMapLocation.path)),
        SizedBox(height: context.screenHeight * 40 / 896),
        AppText(
          text: 'Select Your Location',
          style: AppTextStyle.tsSemiBoldNearBlack26,
        ),
        SizedBox(height: context.screenHeight * 15 / 896),
        AppText(
          text:
              'Switch on your location to stay in tune\nwith whats happening in your area',
          style: AppTextStyle.tsSemiboldNeutralGray16,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.screenHeight * 40 / 896),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your Zone field
              AppText(
                text: 'Your Zone',
                style: AppTextStyle.tsSemiboldNeutralGray16,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _zoneController,
                decoration: InputDecoration(
                  hintText: 'Banasree',
                  hintStyle: AppTextStyle.tsSemiboldNeutralGray14,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Your Area field
              AppText(
                text: 'Your Area',
                style: AppTextStyle.tsSemiboldNeutralGray16,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _areaController,
                decoration: InputDecoration(
                  hintText: 'Types of your area',
                  hintStyle: AppTextStyle.tsSemiboldNeutralGray14,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              SizedBox(height: context.screenHeight * 40 / 896),

              // Submit button
              AppButton(text: 'Submit', onTap: () {
                context.pushReplacementNamed(RouteName.bottomTabName, extra: {
                  'zone': _zoneController.text,
                  'area': _areaController.text,
                });
              }),
            ],
          ),
        ),
      ],
    );
  }
}
