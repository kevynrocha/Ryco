import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Container(
        color: Colors.green,
        child: Center(
          child: ElevatedButton(
            child: const Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
