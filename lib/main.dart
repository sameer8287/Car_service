// import 'dart:js';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isequal2/Screens/home.dart';
// import 'package:isequal2/Screens/home.dart';
import 'package:isequal2/Screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final  prefs = await SharedPreferences.getInstance();
  final isLoggedin = prefs.getBool('isLoggedin') ?? false;
  runApp( MyApp(isLoggedin: isLoggedin,));
}

class MyApp extends StatelessWidget {
  final bool isLoggedin;
  const MyApp({super.key, required this.isLoggedin});

  // This widget is the root of your application.

  // void state()
  // {
  //   final auth  = FirebaseAuth.instance;
  //   final user  = auth.currentUser;
  //
  //   if(user!=null)
  //     {
  //       Navigator.push(context , MaterialPageRoute(builder: (context) => HomeScreen()));
  //     }
  //   else
  //     {
  //       Navigator.push(context , MaterialPageRoute(builder: (context) => LoginScreen()));
  //     }
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: isLoggedin ? const HomeScreen() : const LoginScreen(),
    );
  }
}

