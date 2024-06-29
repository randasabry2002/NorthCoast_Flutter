import 'package:flutter/material.dart';
import 'package:north_coast_flutter/constants.dart';

class ContentIntro extends StatelessWidget {
  const ContentIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Moon House',
            style: TextStyle(
              color: mTitleTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 6,),
          Text(
            'P455,Chhatak,Sylhet',
            style: TextStyle(
              color: mBodyTextColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 15,),
          Text(
            '5000 sqf',
            style: TextStyle(
              color: mBodyTextColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6,),
          Text(
            '\$4455 Fer Month',
            style: TextStyle(
              color: mBodyTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
