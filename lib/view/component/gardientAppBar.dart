import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GardientAppBar extends StatelessWidget{
  const GardientAppBar({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context){
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Theme.of(context).colorScheme.inversePrimary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      leading: const Icon(FontAwesomeIcons.arrowLeft,color: Colors.white,),
      title: SizedBox(
        height: 50,
        child: TextField(

          controller: searchController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          maxLines: 1,

          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white,
            border:  InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
              borderRadius: BorderRadius.circular(50.0),
            ),
            prefixIcon: Icon(Icons.search),


          ),
          onChanged: (value) {
            // Perform search functionality here
          },
        ),
      ),
      actions: [
        Icon(Icons.wallet_giftcard_sharp,color: Colors.white,),
      ],
    );
  }
}