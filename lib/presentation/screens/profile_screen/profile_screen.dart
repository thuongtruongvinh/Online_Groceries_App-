import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/core/app_logger.dart';
import 'package:groceries_app/domain/repositories/local_storage_repository.dart';
import 'package:groceries_app/domain/usecase/get_user_info_usecase.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/presentation/bloc/profile/profile_bloc.dart';
import 'package:groceries_app/presentation/bloc/profile/profile_event.dart';
import 'package:groceries_app/presentation/bloc/profile/profile_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/screens/locale/locale_bloc.dart';
import 'package:groceries_app/presentation/screens/locale/locale_event.dart';
import 'package:groceries_app/presentation/screens/locale/locale_state.dart';
import 'package:groceries_app/presentation/screens/profile_screen/widgets/list_card_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

import 'package:groceries_app/presentation/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        getIt<GetUserInfoUsecase>(),
        FailureMapper(context),
        getIt<AppLogger>(),
      )..add(OnLoadUserInfoEvent()),
      child: const _ProfileScreenView(),
    );
  }
}

class _ProfileScreenView extends StatelessWidget {
  const _ProfileScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.userInfo == null) {
            return Center(
              child: Text(
                'Failed to load user information.',
                style: AppTextStyle.tsRegularNeutralGray16,
              ),
            );
          }
          return SingleChildScrollView(child: _buildBody(context, state));
        },
      ),
    );
  }

  Padding _buildBody(BuildContext context, ProfileState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 69 / 896),
          _buildAvatarAndName(context, state),
          SizedBox(height: context.screenHeight * 50 / 896),
          _buildListCard(context),
          SizedBox(height: 32),
          Row(
            children: [
              Text(AppLocalizations.of(context).deliveryAddress),
              const Spacer(),
              BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isVietnamese,
                    onChanged: (value) {
                      context.read<LocaleBloc>().add(
                        OnChangeLocaleEvent(value ? 'vi' : 'en'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 32 / 896),
          AppButton(
            text: 'Log Out',
            color: AppColors.grayGreen,
            prexixIcon: true,
            onTap: () {
              getIt<ILocalStorage>().setAccessToken('');
              context.go(RouteName.loginPath);
            },
          ),
        ],
      ),
    );
  }

  Row _buildAvatarAndName(BuildContext context, ProfileState state) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(state.userInfo!.image),
        ),
        SizedBox(width: context.screenWidth * 16 / 414),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  state.userInfo!.fullName,
                  style: AppTextStyle.tsSemiBoldNearBlack18.copyWith(
                    height: 1.0,
                  ),
                ),
                SizedBox(width: context.screenWidth * 8 / 414),
                SvgPicture.asset(Assets.icon.icPencill.path),
              ],
            ),
            Text(
              state.userInfo!.email,
              style: AppTextStyle.tsSemiboldNeutralGray14.copyWith(height: 1.0),
            ),
          ],
        ),
      ],
    );
  }

  ListCardWidget _buildListCard(BuildContext context) {
    return ListCardWidget(
      items: [
        ListItem(
          title: AppLocalizations.of(context).orders,
          iconPath: Assets.icon.icOrder.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).myDetails,
          iconPath: Assets.icon.icIdCard.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).deliveryAddress,
          iconPath: Assets.icon.icLocation.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).paymentMethods,
          iconPath: Assets.icon.icCreditcard.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).promoCode,
          iconPath: Assets.icon.icPromo.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).notifications,
          iconPath: Assets.icon.icBell.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).help,
          iconPath: Assets.icon.icQuestion.path,
        ),
        ListItem(
          title: AppLocalizations.of(context).about,
          iconPath: Assets.icon.icAbout.path,
        ),
      ],
    );
  }
}
