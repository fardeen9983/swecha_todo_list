import 'package:flutter/material.dart';
import 'package:swecha_todo_list/screens/add_todo_item_screen.dart';
import 'package:swecha_todo_list/screens/home_screen.dart';
import 'package:swecha_todo_list/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:  {
        "/" : (_) => const SplashScreen(),
        "/home" : (_) => const HomeScreen(),
        "/add" : (_) => const AddToDoItemScreen(),

      },
    );
  }
}