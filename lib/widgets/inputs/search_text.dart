import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchText extends StatelessWidget {
  const SearchText(
      {super.key,
      required this.searchController,
      this.paddingleft,
      this.paddingrighr});
  final TextEditingController searchController;
  final double? paddingleft;
  final double? paddingrighr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: paddingrighr ?? 15, top: 20, left: paddingleft ?? 15),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.black)),
          prefixIcon: const Icon(IconlyLight.search),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
