import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

class ListItem {
  final String title;
  final String iconPath;

  ListItem({required this.title, required this.iconPath});
}

class ListCardWidget extends StatelessWidget {
  final List<ListItem> items;
  const ListCardWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = items[index];
          return Row(
            children: [
              SizedBox(
                height: 16,
                child: SvgPicture.asset(item.iconPath, width: 16),
              ),
              SizedBox(width: context.screenWidth * 25 / 414),
              AppText(
                text: item.title,
                style: AppTextStyle.tsSemiBoldNearBlack18,
              ),
              Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 28),
          child: Divider(height: 1),
        ),
        itemCount: items.length,
      ),
    );
  }
}
