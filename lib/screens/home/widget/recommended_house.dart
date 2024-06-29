import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:north_coast_flutter/screens/detail/detail_screen.dart';

class RecommendedHouse extends StatelessWidget {
  const RecommendedHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.builder(
        itemCount: recommendedList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const DetailScreen();
                },
              ),
            );
          },
          child: Container(
            width: 230,
            height: 300,
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          recommendedList[index].imageUrl,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    width: 25,
                    height: 25,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: mPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.bookmark_rounded,size: 15,color: Colors.white,),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white54,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recommendedList[index].name,
                                style: TextStyle(
                                  color: Color(0xFF0E2E50),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                recommendedList[index].address,
                                style: TextStyle(
                                  color: Color(0xFF0E2E50),
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: mSecondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.favorite,size: 15,color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
