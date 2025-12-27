import 'package:flutter/widgets.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const AppText({super.key, required this.text, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign ?? TextAlign.center);
  }
}
