import 'package:flutter/material.dart';
import 'package:project2/screens/auth/singin.dart';
import 'package:project2/screens/products/products.dart';

import 'colors.dart';
import 'package:share_plus/share_plus.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}