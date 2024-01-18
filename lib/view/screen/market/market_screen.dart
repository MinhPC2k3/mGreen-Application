import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarketScreen extends StatelessWidget{
  MarketScreen({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

            controller: _searchController,
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
      ),
      body: Center(child: Text('Feature comming soon'),),
    );
  }
}