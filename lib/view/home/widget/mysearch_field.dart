import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(35),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black26),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            border: InputBorder.none,
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}