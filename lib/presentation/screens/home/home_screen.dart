import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late Map<String, String> args;
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs != null && routeArgs is Map<String, String>) {
      args = routeArgs;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome! Zone: ${args['zone'] ?? 'N/A'}, Area: ${args['area'] ?? 'N/A'}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}