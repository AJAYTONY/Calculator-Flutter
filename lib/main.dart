import 'package:calculator_flutter/bindings/my_bindings.dart';
import 'package:calculator_flutter/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        title: 'Flutter Calculator',
        home: MainSceen()
    );
  }
}
