import 'package:flutter/material.dart';
import 'package:north_coast_flutter/constants.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 10,),
          Text(
            'Enim veniam dolor sint ipsum culpa magna dolore incididunt laborum excepteu...',
            style: TextStyle(
              color: mBodyTextColor,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
