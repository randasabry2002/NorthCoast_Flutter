import 'package:flutter/material.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:north_coast_flutter/widget/circle_icon_button.dart';

class ContentAppbar extends StatelessWidget {
  const ContentAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/house01.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleIconButton(
                    iconUrl: 'assets/icons/arrow.svg',
                    color: Color(0xFFCECED8),
                  ),
                  CircleIconButton(
                    iconUrl: 'assets/icons/mark.svg',
                    color: mSecondaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
