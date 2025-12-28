import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/repositories/local_storage_repository.dart';
import 'package:groceries_app/domain/usecase/login_user_usecase.dart';
import 'package:groceries_app/presentation/bloc/login/login_bloc.dart';
import 'package:groceries_app/presentation/bloc/login/login_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';
import 'package:groceries_app/presentation/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        getIt<LoginUserUsecase>(),
        getIt<ILocalStorage>(),
        FailureMapper(context),
      ),
      child: const _LoginScreenView(),
    );
  }
}

class _LoginScreenView extends StatelessWidget {
  const _LoginScreenView();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.screenHeight * 77 / 896),
                Center(child: SvgPicture.asset(Assets.icon.icCarrotColor.path)),
                SizedBox(height: context.screenHeight * 100 / 896),
                AppText(
                  text: 'Loging',
                  style: AppTextStyle.tsSemiBoldNearBlack26,
                ),
                SizedBox(height: context.screenHeight * 15 / 896),
                AppText(
                  text: 'Enter your emails and password',
                  style: AppTextStyle.tsRegularNeutralGray16,
                ),
                SizedBox(height: context.screenHeight * 40 / 896),

                /// TextField for username
                AppText(
                  text: 'Email',
                  style: AppTextStyle.tsSemiboldNeutralGray16,
                ),
                TextField(controller: usernameController),
                SizedBox(height: context.screenHeight * 30 / 896),

                /// TextField for password
                AppText(
                  text: 'Password',
                  style: AppTextStyle.tsSemiboldNeutralGray16,
                ),

                TextField(controller: passwordController, obscureText: true),
                SizedBox(height: context.screenHeight * 30 / 896),
                AppText(
                  text: 'Forgot Password?',
                  style: AppTextStyle.tsSemiBoldNearBlack14,
                ),
                SizedBox(height: context.screenHeight * 30 / 896),

                /// Button for login
                AppButton(
                  text: 'Log In',
                  onTap: () {
                    final username = usernameController.text;
                    final password = passwordController.text;
                  },
                ),
                SizedBox(height: context.screenHeight * 25 / 896),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: 'Don\'t have an account?',
                      style: AppTextStyle.tsSemiBoldNearBlack14,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: AppText(
                        text: 'Sign Up',
                        style: AppTextStyle.tsSemiBoldmintGreen14
                            .copyWith(height: 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
