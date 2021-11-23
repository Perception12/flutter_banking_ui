import 'package:flutter/material.dart';
import 'screens/sign_up_page.dart';
import 'colors.dart' as color;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: color.createMaterialColor(color.AppColor.primaryColor),
      ),
      home: const SignUpPage(),
    );
  }
}
