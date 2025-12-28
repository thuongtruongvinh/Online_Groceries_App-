import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({super.key});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}



class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  final TextEditingController controller = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'VN');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DROPDOWN,
        showFlags: true,
        useEmoji: true,
        setSelectorButtonAsPrefixIcon: true,
        trailingSpace: false,
      ),
      initialValue: PhoneNumber(isoCode: 'VN'),
      textFieldController: controller,
      formatInput: true,
      keyboardType: TextInputType.phone,
      hintText: null,
      spaceBetweenSelectorAndTextField: 0,
      inputDecoration: InputDecoration(
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onPressed: () {
                  // Clear the text field
                  context.pushNamed(RouteName.verifyOtpName);
                },
              ),
      ),
    );
  }
}