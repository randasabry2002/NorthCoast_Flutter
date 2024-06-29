import 'package:flutter/material.dart';

import 'model/house.dart';

Color mPrimaryColor = const Color(0xFF00B98E);

Color mTitleTextColor = const Color(0xFF00B98E);

Color mBodyTextColor = const Color(0xFF100E34).withOpacity(0.5);

Color mBackgroundColor = const Color(0xFFF5F6F6);

Color mSecondaryColor = const Color(0xFF00B98E);

final categoryList = ['Top Recommended', 'Near you', 'Agency Recommended'];

final recommendedList = [
  House('The Moon House', 'P455, Chhatak, Sylhet', 'assets/images/house01.jpeg'),
  House('The Moon House', 'P455, Chhatak, Sylhet', 'assets/images/house02.jpeg'),
  House('The Moon House', 'P455, Chhatak, Sylhet', 'assets/images/house01.jpeg'),
  House('The Moon House', 'P455, Chhatak, Sylhet', 'assets/images/house02.jpeg'),
];

final BoxShadow boxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.3),
  spreadRadius: 1,
  blurRadius: 7,
  offset: const Offset(0, 3),
);
