// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../model/PropertyModel.dart';
//
// class PropertyController extends GetxController {
//   var _firestor = FirebaseFirestore.instance;
//   var Properties = <PropertyModel>[].obs;
//   // var favProperty = <PropertyModel>[].obs;
//   var PropertyByCategory = <PropertyModel>[].obs;
//   var PropertyByName = <PropertyModel>[].obs;
//
//   Future<void> getProperties() async {
//     var response = _firestor.collection("Property");
//
//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await response.get();
//
//     Properties.value = querySnapshot.docs.map((doc) {
//       // print(doc.id);
//       return PropertyModel(
//         id: doc.id,
//         name: doc.get('name'),
//         type: doc.get('type'),
//         description: doc.get('description'),
//         address: doc.get('address'),
//         bookedBy: doc.get('bookedBy'),
//         price: doc.get('price'),
//         available: doc.get('available'),
//         images: doc.get('images'),
//         rating: doc.get('rating'),
//       );
//     }).toList();
//     update();
//   }
//
//   getPropertyByName(String Name) async {
//     PropertyByName.clear();
//     // await getProperty();
//     for(var property in Properties){
//       if(property.name == Name){
//         PropertyByName.add(property);
//         print(Name + " equal  " +property.name!);
//       }
//     }
//     // print("PropertyByName.length = "+ PropertyByName.length.toString());
//
//     update();
//   }
//
//   filterPropertyByCategory(String typeName) async {
//     await getProperties();
//     PropertyByCategory.clear();
//     if (Properties.isNotEmpty) {
//       for (var property in Properties) {
//         if (property.type == typeName) {
//           PropertyByCategory.add(property);
//         }
//       }
//     }
//     if (Properties.isNotEmpty) {
//       for(var i in PropertyByCategory)
//         print(i.name.toString());
//     } else {
//       print("Categories list is empty");
//     }
//     update();
//   }
//
//   // getFavs() async {
//   //   favProperty.clear();
//   //   await getProperty();
//   //   for(var Resipe in Property){
//   //     if(Resipe.Fav == true){
//   //       favProperty.add(Resipe);
//   //     }
//   //   }
//   //   update();
//   // }
//   //
//   // changeFav(String recipeId,bool newFav) async {
//   //   await FirebaseFirestore.instance.collection('Property').doc(recipeId).update({'Fav': newFav});
//   //   print("Fav updated  "+ newFav.toString());
//   //   // update();
//   //   await getFavs();
//   //   update();
//   //
//   // }
// }
