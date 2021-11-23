import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:flutter_banking_ui/screens/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: color.createMaterialColor(color.AppColor.primaryColor),
      ),
      home: const SignInPage(),
    );
  }
}
