import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: TextField(
        cursorColor: Color(0xFF00B98E),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: 'Search here......',
          hintStyle: TextStyle(color: Color(0xFF00B98E), ),
          prefixIcon: IconButton(
            padding: const EdgeInsets.all(14),
            icon: Icon(Icons.search,color: Color(0xFF00B98E),),
            onPressed: () {  },
          ),
          contentPadding: const EdgeInsets.all(2)
        ),
      ),
    );
  }
}