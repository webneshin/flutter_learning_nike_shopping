import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/data/repo/banner_repository.dart';
import 'package:flutter_learning_nike_shopping/data/repo/product_repository.dart';
import 'package:flutter_learning_nike_shopping/theme.dart';
import 'package:flutter_learning_nike_shopping/ui/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var webneshinTheme = WebneshinTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: webneshinTheme.light(),
      darkTheme: webneshinTheme.dark(),
      themeMode: ThemeMode.light,
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}
