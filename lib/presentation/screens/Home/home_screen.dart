import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text(
          'Zone: ${data['zone']}\nArea: ${data['area']}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
