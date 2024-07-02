import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:north_coast_flutter/model/PropertyModel.dart';
import 'package:north_coast_flutter/screens/detail/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RecommendedHouse extends StatefulWidget {
  const RecommendedHouse({super.key});

  @override
  State<RecommendedHouse> createState() => _RecommendedHouseState();
}

class _RecommendedHouseState extends State<RecommendedHouse> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: StreamBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PropertyModel> Properties = [];
            var responseProperties = snapshot.data!.docs;
            Properties.clear();

            for (var i = 0; i < responseProperties.length; i++) {
              String id = responseProperties[i].id;
              String? name = responseProperties[i].get('name');
              String? type = responseProperties[i].get('type');
              String? description = responseProperties[i].get('description');
              String? address = responseProperties[i].get('address');
              String? bookedBy = responseProperties[i].get('bookedBy');
              int? price = responseProperties[i].get('price');
              double? rating = responseProperties[i].get('rating');
              bool? available=responseProperties[i].get('available');
              List? images = responseProperties[i].get('images');
              
              if(Properties.length<5){
                Properties.add(PropertyModel(
                  id: id,
                  name: name,
                  type: type,
                  description: description,
                  address: address,
                  bookedBy: bookedBy,
                  price: price,
                  available: available,
                  images: images,
                  rating: rating,
                ));
              }

            }
            
            return Stack(
              children: [
                ListView.builder(
                  itemCount: Properties.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {

                      Get.to(DetailScreen(id: Properties[index].id));
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
                                  image: NetworkImage(
                                    Properties[index].images![0],
                                  ),
                                  fit: BoxFit.cover),
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
                                          Properties[index].name!,
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
                                          Properties[index].address!,
                                          style: TextStyle(
                                            color: Color(0xFF0E2E50),
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ///********************************************
                                  ///favorite   **********************************************************
                                  // Container(
                                  //   width: 25,
                                  //   height: 25,
                                  //   padding: const EdgeInsets.all(5),
                                  //   decoration: BoxDecoration(
                                  //     color: mSecondaryColor,
                                  //     shape: BoxShape.circle,
                                  //   ),
                                  //   child: Icon(Icons.favorite,size: 15,color: Colors.white,),
                                  // )
                                  ///**************************************************************************
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(child: Text("Wait a Second, Data is loading!!"));
          }
        },
        stream: firestore
            .collection("Property").orderBy("rating",descending: true)
            .snapshots(),

      ),
    );
  }
}
