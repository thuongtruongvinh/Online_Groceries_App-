import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/screens/login/login_screen.dart';

/// code phải dễ đọc, dễ hiểu, dễ mở rộng, dễ bảo trì, dễ tái sử dụng, sau kiểm thử

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}
