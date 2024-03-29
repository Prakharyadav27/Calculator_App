import 'package:flutter/material.dart';
import 'package:learnapk/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: SafeArea(
          bottom: false,
          child: CalculatorView(),
        ));
  }
}
