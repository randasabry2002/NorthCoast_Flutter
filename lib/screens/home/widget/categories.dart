import 'package:flutter/material.dart';
import 'package:north_coast_flutter/constants.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/PropertyModel.dart';
import '../../detail/detail_screen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int currentSelect = 0;
  bool roomsTaped = false;
  bool chaletTaped = false;
  bool villaTaped = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: mPrimaryColor,
              ),
              child: Row(
                children: [
                  /// ***********************************************************
                  Expanded(
                    flex: roomsTaped ? 6 : 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          roomsTaped = true;
                          chaletTaped = false;
                          villaTaped = false;
                        });
                        // print('All Tasks part tapped!');
                      },
                      child: Container(
                        height: 55, // Adjust height as needed
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: roomsTaped ? Color(0xFF100E34) : mPrimaryColor,
                        ),
                        child: const Text(
                          'Rooms',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: villaTaped ? 6 : 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          villaTaped = true;
                          roomsTaped = false;
                          chaletTaped = false;
                        });
                        // print('All Tasks part tapped!');
                      },
                      child: Container(
                        height: 55, // Adjust height as needed
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: villaTaped ? Color(0xFF100E34) : mPrimaryColor,
                        ),
                        child: const Text(
                          'Villas',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: chaletTaped ? 6 : 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          roomsTaped = false;
                          chaletTaped = true;
                          villaTaped = false;
                        });
                        // print('Pinned part tapped!');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color:
                              chaletTaped ? Color(0xFF100E34) : mPrimaryColor,
                        ),
                        height: 55, // Adjust height as needed
                        alignment: Alignment.center,
                        child: Text(
                          'Chalet',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 280,
            child: StreamBuilder<QuerySnapshot>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PropertyModel> Properties = [];
                  List<PropertyModel> villaProperties = [];
                  List<PropertyModel> chaletProperties = [];
                  List<PropertyModel> roomProperties = [];
                  var responseProperties = snapshot.data!.docs;
                  Properties.clear();

                  for (var i = 0; i < responseProperties.length; i++) {
                    String id = responseProperties[i].id;
                    String? name = responseProperties[i].get('name');
                    String? type = responseProperties[i].get('type');
                    String? description =
                        responseProperties[i].get('description');
                    String? address = responseProperties[i].get('address');
                    String? bookedBy = responseProperties[i].get('bookedBy');
                    int? price = responseProperties[i].get('price');
                    double? rating = responseProperties[i].get('rating');
                    bool? available = responseProperties[i].get('available');
                    List? images = responseProperties[i].get('images');

                    if(type=="villa"){
                      villaProperties.add(PropertyModel(
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
                    else if(type=="room"){
                      roomProperties.add(PropertyModel(
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
                    else{
                      chaletProperties.add(PropertyModel(
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

                  if(villaTaped){
                    Properties=villaProperties;
                  }
                  else if(chaletTaped){
                    Properties=chaletProperties;
                  }
                  else{
                    Properties=roomProperties;
                  }

                  return Stack(
                    children: [
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: Properties.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(DetailScreen(id: Properties[index].id));
                          },
                          child: Container(
                            width: 350,
                            height: 100,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                  return const Center(
                      child: Text("Wait a Second, Data is loading!!"));
                }
              },
              stream: firestore.collection("Property").snapshots(),
            ),
          ),
        ],
      ),
    );
  }
}
