import 'package:flutter/material.dart';

import 'connection_model.dart';

class MiniAppDisplay extends StatelessWidget{
  const MiniAppDisplay({super.key, required this.listMiniApp, required this.index});
  final Map<MiniAppInfo,Widget> listMiniApp;
  final int index;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>listMiniApp.entries.elementAt(index).value));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10),),
              border: Border.all(
                width: 1,
                color: Colors.grey[400]!,
                style: BorderStyle.solid,
              ),
            ),
            child: Image.network(listMiniApp.entries.elementAt(index).key.appPicture!),
          ),
          Text(listMiniApp.entries.elementAt(index).key.appName!,style: const TextStyle(fontSize: 12,color: Colors.black),)

        ],
      ),
    );
  }
}