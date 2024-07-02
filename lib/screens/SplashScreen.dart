import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:north_coast_flutter/screens/SignInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Define animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );


    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });

    SharedPreferences.getInstance().then((value) {
      String email = value.getString("email").toString();
      print("email: $email");

      // Simulate a delay for demonstration purposes
      Future.delayed(Duration(seconds: 2), () {
        if (email != 'null') {
          // User is logged in, navigate to home or any other screen
          // Replace `HomeScreen` with the actual screen you want to navigate to
          Get.off(() => HomeScreen());
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomeScreen()),
          // );
        } else {
          // User is not logged in, navigate to Signin screen
          Get.off(() => SignInScreen());
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => SignInScreen()),
          // );
        }
      });
    });

    // Define animation;
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //59C9B6
      backgroundColor: Color(0xFB59CAB6),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              // Container(
              //   height: double.infinity,
              //   width: double.infinity,
              //   child: Opacity(
              //     opacity: 0.9,
              //     child: Image.asset(
              //       'assets/images/splashIcon .png',
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              //
              // ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Image.asset('assets/images/logo.jpg'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );

  }
}