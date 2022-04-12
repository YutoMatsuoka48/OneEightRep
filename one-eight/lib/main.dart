import 'package:flutter/material.dart';
import 'ui/login.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: OneEightAPP()));
}

class OneEightAPP extends StatelessWidget {
  const OneEightAPP({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'OneEight',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: const MyHomePage(title: 'OneEight Home Page'),
      home: Login(),
    );
  }
}
