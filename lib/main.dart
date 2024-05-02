import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/home_page.dart';
import 'View/login_screen.dart';
import 'View/register_screen.dart';
import 'View/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Halawa());
}

class Halawa extends StatefulWidget {
  const Halawa({Key? key}) : super(key: key);

  @override
  State<Halawa> createState() => _HalawaState();
}

class _HalawaState extends State<Halawa> {
  @override
  // void initState() {
  //   FirebaseAuth.instance
  //       .authStateChanges()
  //       .listen((User? user) {
  //     if (user == null) {
  //       print('---User is currently signed out!---');
  //     } else {
  //       print('-----------User is signed in!-------');
  //     }
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
        LoginScreen.id:(context) => const  LoginScreen(),
        RegisterScreen.id:(context )=>const RegisterScreen(),
        HomePage.id:(context)=>const HomePage(),
      },
      //لو انا عامل تسجيل دخول هيدخلني علي الصفحه الرئيسيه
      home: SplashScreen(),
      //FirebaseAuth.instance.currentUser == null ?  :  HomeScreen(),
    );
  }
}

