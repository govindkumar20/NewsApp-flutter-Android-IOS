import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplash = true;
  LoadHome() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showingSplash = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyDigest',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 92, 10, 233)),
        useMaterial3: true,
      ),
      home: showingSplash ? SplashScreen() : HomeScreen(),
    );
  }
}
