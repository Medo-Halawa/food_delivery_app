import 'package:flutter/material.dart';
import 'package:halawa/View/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String  id ="RegisterScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:3), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder:(context){
            return OnBoarding();
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Pink Minimalist Marble Notebook Book Cover.jpg"),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}
