import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/presentation/bloc/bottom_tab/bottom_tab_bloc.dart';
import 'package:groceries_app/presentation/screens/home/home_screen.dart';
import 'package:groceries_app/presentation/screens/cart/cart_screen.dart';
import 'package:groceries_app/presentation/screens/explore/explore_screen.dart';
import 'package:groceries_app/presentation/screens/favourite/favourite_screen.dart';
import 'package:groceries_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';
import 'package:groceries_app/presentation/theme/app_colors.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  late PageController _pageController;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    context.read<BottomTabBloc>().changeSelectedIndex(page);
  }

  /// SVG icon helper
  Widget _svgIcon(String path, Color color) {
    return SizedBox(
      width: 18,
      height: 18,
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return [
      BottomNavigationBarItem(
        icon: _svgIcon(Assets.icon.icStore.path, AppColor.nearBlack),
        activeIcon: _svgIcon(Assets.icon.icStore.path, AppColor.mintGreen),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: _svgIcon(Assets.icon.icExplore.path, AppColor.nearBlack),
        activeIcon: _svgIcon(Assets.icon.icExplore.path, AppColor.mintGreen),
        label: 'Explore',
      ),
      BottomNavigationBarItem(
        icon: _svgIcon(Assets.icon.icCart.path, AppColor.nearBlack),
        activeIcon: _svgIcon(Assets.icon.icCart.path, AppColor.mintGreen),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: _svgIcon(Assets.icon.icHeart.path, AppColor.nearBlack),
        activeIcon: _svgIcon(Assets.icon.icHeart.path, AppColor.mintGreen),
        label: 'Favourite',
      ),
      BottomNavigationBarItem(
        icon: _svgIcon(Assets.icon.icUser.path, AppColor.nearBlack),
        activeIcon: _svgIcon(Assets.icon.icUser.path, AppColor.mintGreen),
        label: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWrapperBody(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BlocBuilder<BottomTabBloc, int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.mintGreen,
          unselectedItemColor: AppColor.nearBlack,
          onTap: (index) {
            _pageController.jumpToPage(index);
            context.read<BottomTabBloc>().changeSelectedIndex(index);
          },
          items: _items(),
        );
      },
    );
  }

  PageView _mainWrapperBody() {
    return PageView(
      controller: _pageController,
      onPageChanged: onPageChanged,
      children: _screens,
    );
  }
}
