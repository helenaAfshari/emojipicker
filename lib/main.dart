import 'package:flutter/material.dart';
import 'package:emoji_picker_getx/main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'emoji_picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:EmojiPickerScreen(),
    );
  }
}

