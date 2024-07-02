import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:card_swiper/card_swiper.dart';

class DetailScreen extends StatefulWidget {
  String? id;

  DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? id;
  String? name;
  String? address;
  String? description;
  String? bookedBy;
  String? type;
  bool? available;
  int? price;
  double? rating;
  List? images;

  late SwiperController swiperController;
  late Timer timer;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    swiperController = SwiperController();
    startTimer();
    getPropertyById();
  }

  @override
  void dispose() {
    swiperController.dispose();
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      swiperController.next(); // Automatically move to the next slide
    });
  }

  getPropertyById() async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection("Property").doc(widget.id).get();

      id = snapshot.id;
      name = snapshot.get('name');
      type = snapshot.get('type');
      description = snapshot.get('description');
      address = snapshot.get('address');
      bookedBy = snapshot.get('bookedBy');
      price = snapshot.get('price');
      rating = snapshot.get('rating');
      available = snapshot.get('available');
      images = snapshot.get('images');
    } catch (e) {
      // Handle errors, such as task not found
      print("Error fetching task: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: name==null?Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 200,
        ),
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: 400,
            child: Stack(
              children: [
                Swiper(
                  controller: swiperController,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      images![index],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    );
                  },
                  itemCount: images!.length,
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
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                        // IconButton(
                        //   icon: Icon(Icons.favorite),
                        //   color: Colors.white, onPressed: () {  },
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                      color: mTitleTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  address!,
                  style: TextStyle(
                    color: mBodyTextColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$${price} Fer Month',
                  style: TextStyle(
                    color: mBodyTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    color: mTitleTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description!,
                  style: TextStyle(
                    color: mBodyTextColor,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                ///************************************
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor:
                    Color(0xFB59CAB6), // Replace with your primary color
              ),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
