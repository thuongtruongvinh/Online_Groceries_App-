import 'package:flutter/material.dart';
import 'package:groceries_app/core/extension/context_extension.dart';
import 'package:groceries_app/presentation/routes/app_routes.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';
import 'package:groceries_app/presentation/shared/app_loading.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';
import 'package:groceries_app/presentation/theme/theme.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(child: _buildBody(context)),
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.screenHeight * 65 / 896),
          AppText(
            text: 'Enter Your 4-digit code',
            style: AppTextStyle.tsSemiBoldNearBlack26,
          ),
          SizedBox(height: context.screenHeight * 27 / 896),
          AppText(text: 'Code', style: AppTextStyle.tsSemiboldNeutralGray16),
          SizedBox(height: context.screenHeight * 10 / 896),
          _buildTextField(),
          SizedBox(height: context.screenHeight * 10 / 896),
          _buildResendCode(),
        ],
      ),
    );
  }

  //resend Code
  Widget _buildResendCode() {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 120, end: 0),
      duration: const Duration(seconds: 120),
      builder: (context, value, child) {
        return AppText(
          text: 'Resend code in $value',
          style: AppTextStyle.tsSemiboldNeutralGray14,
        );
      },
      onEnd: () {},
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const Dialog(
            backgroundColor: Colors.transparent,
            child: AppLoading(),
          ),
        );
        await Future.delayed(const Duration(seconds: 1));
        if (!context.mounted) return;
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.selectLocationScreen,
          (route) => false,
        );
      },
      backgroundColor: AppColor.mintGreen,
      child: const Icon(Icons.chevron_right, size: 30, color: Colors.white),
    );
  }

  TextField _buildTextField() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.number,
      maxLength: 4,
      style: AppTextStyle.tsSemiBoldNearBlack18,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.nearBlack, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.nearBlack, width: 0),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left, size: 30),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
