import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemt/home_page.dart';
import 'package:statemt/model/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return Cart();
        },
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'training on stm',
          home: HomePage(),
        ));
  }
}
