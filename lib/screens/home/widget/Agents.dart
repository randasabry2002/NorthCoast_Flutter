import 'package:flutter/material.dart';

class Agents extends StatefulWidget {
  const Agents({super.key});

  @override
  State<Agents> createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {

  List agentsList =[
    {
      "Image" : "assets/images/m1.jpg",
      "Name" : "Mohamed Mafaz",
      "Des" : " Designation ",
    },
    {
      "Image" : "assets/images/h1.jpg",
      "Name" : "Ahmed Hatem",
      "Des" : "Designation",
    },
    {
      "Image" : "assets/images/mahmoud_salah.jpg",
      "Name" : "Mahmoud Salah",
      "Des" : "Designation",
    },
    {
      "Image" : "assets/images/abd_elrahman.jpg",
      "Name" : "Abd EL Rahman",
      "Des" : "Designation",
    },

  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10.0, // Spacing between each column
            mainAxisSpacing: 10.0,// Spacing between each row
            childAspectRatio: (140/150)
        ),
        padding: EdgeInsets.all(10.0), // Padding around the grid
        itemCount: agentsList.length, // Total number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          // Builder function to generate each grid item
          final agent = agentsList[index];
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 70,backgroundImage: AssetImage("${agent["Image"]}",),),
                  Text("${agent["Name"]}",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 20,color: Color(0xFB59CAB6)),),
                  Text("${agent["Des"]}",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Playwrite",fontSize: 15,color: Color(0xFB59CAB6))),

                ],)
          );
        },
      ),
    );
  }
}
