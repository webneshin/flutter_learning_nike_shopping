import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/theme.dart';
import 'package:flutter_learning_nike_shopping/ui/auth/auth.dart';
import 'package:flutter_learning_nike_shopping/ui/home/home.dart';
import 'package:flutter_learning_nike_shopping/ui/root.dart';

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
      scrollBehavior: MyCustomScrollBehavior(),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: AuthScreen()),
    );
  }
}


// Enable scrolling with mouse dragging
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}