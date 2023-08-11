
import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/common/exception.dart';

class AppErrorWidget extends StatelessWidget {
  final AppException exception;
  final GestureTapCallback onPressed;
  const AppErrorWidget({
    super.key, required this.exception, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              exception.message,
              style:
              TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            ElevatedButton(
                onPressed: onPressed,
                child: const Text('تلاش مجدد'))
          ],
        ));
  }
}