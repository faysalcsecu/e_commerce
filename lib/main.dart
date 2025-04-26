import 'package:flutter/material.dart';
import 'presentation/screens/product_list_screen.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FakeStore',
      theme: appTheme,
      home: const ProductListScreen(),
    );
  }
}
