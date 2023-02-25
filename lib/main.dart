import 'package:flutter/material.dart';
import 'package:todo_list/screens/add_item_screen.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ToDo List Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (_) => const SplashScreen(),
          "/home": (_) => const HomeScreen(),
          "/add": (_) => const AddItemScreen(),
        },
      ),
    );
  }
}
