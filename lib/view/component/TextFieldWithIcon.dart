import 'package:flutter/material.dart';

class TextFiledWithIcon extends StatelessWidget {
  const TextFiledWithIcon({super.key, required this.textEditingController,required this.iconData,required this.labelText});
  final TextEditingController textEditingController;
  final IconData iconData;
  final String labelText;
  @override
  Widget build (BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width *1,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.name,
        decoration:  InputDecoration(
          hintStyle: const TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),
          hintText: labelText,
          prefixIcon: Icon(iconData,color: Colors.green[300]),
        ),
        maxLines: 1,
      ),
    );
  }
  
}