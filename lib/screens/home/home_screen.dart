import 'dart:async';

import 'package:flutter/material.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:north_coast_flutter/screens/home/widget/welcome_text.dart';
import 'widget/best_offer.dart';
import 'widget/categories.dart';
import 'widget/recommended_house.dart';
import 'widget/search_input.dart';
import 'package:card_swiper/card_swiper.dart';
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

  late SwiperController swiperController;

  int currentIndex = 3;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    swiperController = SwiperController();
    startTimer();
  }

  @override
  void dispose() {
    swiperController.dispose();
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (currentIndex < imgList.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      swiperController.move(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          color: Colors.transparent,
          child: SafeArea(
              child: AppBar(
            backgroundColor: Colors.transparent,
            // leading: IconButton(
            //   padding: EdgeInsets.only(left: 5),
            //   icon: SvgPicture.asset('assets/icons/menu.svg',width: 30,height: 35,),
            //   onPressed: () {},
            // ),
            title: Text(
              "North Coast",
              style: TextStyle(
                  fontFamily: "Playwrite",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00B98E)),
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
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   height: 300,
            //   width: double.infinity,
            //   child: Image.asset(
            //     'assets/images/homeImage.jpg',
            //     fit: BoxFit.fill,
            //     // height: double.infinity,
            //     // width: double.infinity,
            //   ),
            // ),
            Container(
              height: 250,
              child: Swiper(
                controller: swiperController,
                itemBuilder:
                    (BuildContext context, int index) {
                  return new Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: 4,
                viewportFraction: 1,
                scale: 1,
                loop: true, // Optional: set to true if you want it to loop
                autoplay: false, // Set to false since we are controlling autoplay manually
                onIndexChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            WelcomeText(),
            SearchInput(),
            Categories(),
            SizedBox(
              height: 20,
            ),
            RecommendedHouse(),
            ///******************************************
            BestOffer(),
          ],
        ),
      ),
    );
  }
}

// class CustomBottombar extends StatelessWidget {
//   const CustomBottombar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 25),
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(36),
//           boxShadow: [boxShadow]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SvgPicture.asset('assets/icons/home.svg'),
//           SvgPicture.asset('assets/icons/home_search.svg'),
//           SvgPicture.asset('assets/icons/notification.svg'),
//           SvgPicture.asset('assets/icons/chat.svg'),
//           SvgPicture.asset('assets/icons/home_mark.svg'),
//         ],
//       ),
//     );
//   }
// }
