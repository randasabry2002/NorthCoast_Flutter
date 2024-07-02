import 'dart:async';
import 'package:flutter/material.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:north_coast_flutter/screens/home/widget/Agents.dart';
import 'package:north_coast_flutter/screens/home/widget/welcome_text.dart';
import '../SignInScreen.dart';
import 'widget/categories.dart';
import 'widget/recommended_house.dart';
import 'widget/search_input.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List imgList = [
    'assets/images/homeImage.jpg',
    'assets/images/house01.jpeg',
    'assets/images/house02.jpeg',
    'assets/images/best_house.jpeg',
  ];
  String? userName;

  late SwiperController swiperController;
  late Timer timer;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      swiperController.next(); // Automatically move to the next slide
    });
  }

  @override
  void initState() {
    super.initState();
    swiperController = SwiperController();
    startTimer();
    SharedPreferences.getInstance().then((value) {
      userName = value.getString("userName").toString();
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    swiperController.dispose();
    timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: mBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          color: Colors.transparent,
          child: SafeArea(
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                "North Coast",
                style: TextStyle(
                  fontFamily: "Playwrite",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFB59CAB6),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.menu, // Replace with your custom icon
                  size: 30,
                  color: Color(0xFB59CAB6), // Adjust color as needed
                ),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer(); // Open the drawer using GlobalKey
                },
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage(
                      'assets/images/logo2.png',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFB59CAB6),
                image: DecorationImage(image: AssetImage("assets/images/logo.jpg",))
              ),
              child: SizedBox(),
            ),
            // ListTile(
            //   leading: Icon(Icons.search,color: Color(0xFB59CAB6),size: 30,),
            //   title: Text('Explore',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),),
            //   onTap: () {
            //     // Handle drawer item 1 tap
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.favorite,color: Color(0xFB59CAB6),size: 30,),
            //   title: Text('Favorits',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),),
            //   onTap: () {
            //     // Handle drawer item 1 tap
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.person,color: Color(0xFB59CAB6),size: 30,),
            //   title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),),
            //   onTap: () {
            //     // Handle drawer item 2 tap
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.add,color: Color(0xFB59CAB6),size: 30,),
            //   title: Text('Add Proberity',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),),
            //   onTap: () {
            //     // Handle drawer item 2 tap
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Align(alignment: Alignment.center,child: Text("Hello $userName",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),)),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Color(0xFB59CAB6),size: 30,),
              title: Text('Log Out',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),),
              onTap: () async {
                final SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                await _prefs.setString(
                    "email", "null");

                Get.offAll(SignInScreen());
              },
            ),
            // Add more ListTile widgets or other drawer content
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              child: Swiper(
                controller: swiperController,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: imgList.length,
                viewportFraction: 1,
                scale: 1,
                loop: true, // Enable looping
                autoplay: true, // Enable autoplay
                autoplayDelay: 3000, // Optional: Delay between slides (milliseconds)
                autoplayDisableOnInteraction: false, // Allow autoplay to continue after user interaction
                onIndexChanged: (index) {
                  // Handle index change if needed
                },
              ),
            ),
            WelcomeText(),
            SizedBox(height: 30,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.start,
                'Top Recommended',
                style: TextStyle(
                  fontFamily: "Playwrite",
                  color: Color(0xFB59CAB6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RecommendedHouse(),
            // SearchInput(),
            SizedBox(height: 30,),
            Categories(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                textAlign: TextAlign.center,
                'Property Agents',
                style: TextStyle(
                  fontFamily: "Playwrite",
                  color: Color(0xFB59CAB6),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Agents(),
            // SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

