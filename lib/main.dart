import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/data/repo/banner_repository.dart';
import 'package:flutter_learning_nike_shopping/data/repo/product_repository.dart';
import 'package:flutter_learning_nike_shopping/theme.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // test repository services
    productRepository.getAll(ProductSort.latest).then((value) {
      value.forEach((element) {
        print("${element.title} ::: ${element.price}");
      });
      print(value.length);
    });
    productRepository.search("پیاده").then((value) {
      value.forEach((element) {
        print("${element.title} ::: ${element.price}");
      });
      print(value.length);
    });
    bannerRepository.getAll().then((value) {
      value.forEach((element) { 
        print(element.imageUrl);
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("فروشگاه نایک"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.light_mode)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'سلام سلام جهان من!',
            ),
            TextButton(onPressed: () {}, child: Text("ثبت سفارش")),
            FilledButton(onPressed: () {
              
            }, child: Text("دکمه"))
          ],
        ),
      ),
    );
  }
}
