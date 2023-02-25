import 'package:flutter/material.dart';
import 'package:todo_list/todo_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: size.width * 0.5,
          height: size.height * 0.5,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(context, "/home");

    });
  }
}
