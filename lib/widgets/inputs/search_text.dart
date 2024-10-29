import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key, required this.searchController, this.Paddingleft, this.Paddingrighr});
  final TextEditingController searchController;
  final double ?Paddingleft;
    final double? Paddingrighr;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Paddingrighr??15,top: 20,left: Paddingleft??15),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.black)),
          prefixIcon: Icon(IconlyLight.search),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
