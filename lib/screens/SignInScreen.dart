import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:north_coast_flutter/screens/SignUpScreen.dart';
import 'package:north_coast_flutter/screens/home/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:recipes_flutter_app/screens/SignUp.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:get/get.dart';
class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  bool isValidEmail(String email) {
    // Regular expression to check for a valid email format
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  String password = '';
  String email = '';
  bool isPasswordVisible = true;
  // final _auth = FirebaseAuth.instance;
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFB59CAB6),
      body: SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo2.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 50),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                  // Check if the entered email is in a valid format
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                cursorColor: Colors.white,
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: isPasswordVisible,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                  if (password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Enter your password"),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,color: Colors.grey[600],),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  hintText: 'Enter your password',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                cursorColor: Colors.white,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // try {
                    //   await _auth.signInWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if (_auth.currentUser != null) {
                    //     final SharedPreferences _prefs =
                    //     await SharedPreferences.getInstance();
                    //     await _prefs.setString(
                    //         "email", _auth.currentUser!.email.toString());
                    //
                    //     await usersController.getUserByEmail(
                    //         _auth.currentUser!.email.toString());
                    //     await _prefs.setString(
                    //         "userName",
                    //         usersController.userByEmail.value.UserName!);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                    //   }
                    // } catch (e) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text("Invalid email or password"),
                    //     ),
                    //   );
                    //   print("Wrong Email or Password");
                    //   // const SnackBar(
                    //   //   content: Text("Wrong Email or Password"),
                    //   // );
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text("Wrong Email or Password"),
                    //   ));
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Color(0xFB59CAB6),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // await GoogleSignIn().signOut();
                    // final GoogleSignInAccount? googleUser =
                    // await GoogleSignIn().signIn();
                    //
                    // final GoogleSignInAuthentication googleAuth =
                    // await googleUser!.authentication;
                    //
                    // final credential = GoogleAuthProvider.credential(
                    //   accessToken: googleAuth.accessToken,
                    //   idToken: googleAuth.idToken,
                    // );
                    // await _auth.signInWithCredential(credential);
                    // if (_auth.currentUser != null) {
                    //   final SharedPreferences _prefs =
                    //   await SharedPreferences.getInstance();
                    //   await _prefs.setString(
                    //       "email", _auth.currentUser!.email.toString());
                    //
                    //   await usersController.getUserByEmail(
                    //       _auth.currentUser!.email.toString());
                    //   await _prefs.setString(
                    //       "userName",
                    //       usersController.userByEmail.value.UserName!);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: const Text(
                    'Sign In With Google',
                    style: TextStyle(
                        color: Color(0xFB59CAB6),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontSize: 20.0),
                  children: <TextSpan>[
                    TextSpan(text: "If you don't have account ",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Sign up');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
