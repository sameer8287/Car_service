// import 'dart:html';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:isequal2/Screens/home.dart';
import 'package:isequal2/utiles/roundbtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isequal2/utiles/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool Loading = false;
  final _formKey = GlobalKey<FormState>();
  final _auth  = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController pass  = TextEditingController();

  void login ()
  {
    _auth.signInWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString()).then((value) async {
      setState(() {
        Loading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setBool('isLoggedin', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).onError((error, stackTrace) {
      Toasts().messages(error.toString());
      setState(() {
        Loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/taxidriver.png'),
                    // backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: 'Email',
                          label: Text('Email'),
                          prefixIcon: Icon(Icons.email)
                      ),
                      autofillHints: [AutofillHints.email],
                      validator: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return 'Enter the Email';
                          }
                        else if(!EmailValidator.validate(value))
                          {
                            return 'Enter Correct email';
                          }
                        else
                          {
                            return null;
                          }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: pass,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: 'Password',
                          label: Text('password'),
                          prefixIcon: Icon(Icons.lock)
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return 'Enter the Password';
                          }
                        else
                          {
                            return null;
                          }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Roundbtn(
                    loading: Loading,
                    ontap: (){
                      if(_formKey.currentState!.validate())
                        {
                          setState(() {
                            Loading = true;
                          });
                          login();
                        }
                    },
                  )
                ],
              ))

            ],
          ),
        ),
      ),
    );
  }
}
