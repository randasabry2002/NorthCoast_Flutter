import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';
// import 'Navigation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen>{
  String password = '';
  String confirmPassword = '';
  String email = '';
  String userName = '';
  bool isPasswordVisible = true;
  
  // final _auth = FirebaseAuth.instance;
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // var _firestor = FirebaseFirestore.instance;
  //
  // addUser(){
  //   _firestor.collection("Users").add({
  //     "UserName": userName,
  //     "Email": _auth.currentUser!.email,
  //     "Password": password,
  //     "ProfileImagePath": _image!.path,
  //   });
  // }

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
                    userName = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter User Name',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
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
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
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
                      borderRadius: BorderRadius.all(Radius.circular(50))),
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
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility, color: Colors.grey[600],),
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
                      borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    confirmPassword = value;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility ,color: Colors.grey[600],),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  hintText: 'Confirm your password',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
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
                    if (userName.isEmpty) {/// //////////////////////////////////////////////////
                      print("Enter User Name");
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter User Name"),
                      ));
                    } else if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter Email"),
                      ));
                    } else if (password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter Password"),
                      ));
                    } else if (confirmPassword!=password) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Check Your Password"),
                      ));
                    } else {
                      // try {
                        // await _auth.createUserWithEmailAndPassword(email: email,
                        //     password: password);
                        //
                        // if (_auth.currentUser != null) {
                        //   final SharedPreferences _prefs =
                        //   await SharedPreferences.getInstance();
                        //   await _prefs.setString(
                        //       "email", _auth.currentUser!.email.toString());
                        //   await _prefs.setString("userName", userName);
                        //
                        //   addUser();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                      //   }
                      // } catch (e) {
                      //   print("Check Your Data, This Email may be used before $e");
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text("Check Your Data, This Email may be used before or you haven't picked profile image"),
                      //   ));
                      // }

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Color(0xFB59CAB6),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


