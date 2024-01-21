// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget{
  const CardImage({super.key,this.height =300, this.width, this.imageHeight =100, required this.borderRadius, required this.imageProvider,this.children});
  final double? height;
  final double? width;
  final double? imageHeight;
  final double borderRadius;
  final ImageProvider imageProvider;
  final List<Widget>? children;



  @override
  Widget build(BuildContext context){
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        // boxShadow: [
        //   BoxShadow(color: Colors.grey, spreadRadius: 1),
        // ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            child: Container(
              constraints: BoxConstraints(
                minWidth: width??200,
                maxWidth: width??200,
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Wrap(
            spacing:  12,
            runSpacing: 10,
            children: children!,
          ),
        ],
      ),
    );
  }
}