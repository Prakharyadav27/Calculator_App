import 'package:flutter/material.dart';
import 'package:learnapk/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hello jii",
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: HomeView());
  }
}
