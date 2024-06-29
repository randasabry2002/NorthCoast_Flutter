import 'package:flutter/material.dart';
import 'widget/about.dart';
import 'widget/content_appbar.dart';
import 'widget/content_intro.dart';
import 'widget/house_info.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContentAppbar(),
          const SizedBox(
            height: 20,
          ),
          const ContentIntro(),
          const SizedBox(
            height: 20,
          ),
          const HouseInfo(),
          const SizedBox(
            height: 25,
          ),
          const About(),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue, // Replace with your primary color
              ),
              // child: Text('Button Text', style: TextStyle(color: Colors.white)),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
