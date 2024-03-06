import 'package:flutter/material.dart';
import 'package:mgreen_app/connection_standard/web_app/presentation/wepapp_main%20.dart';

import 'connection_model.dart';
import 'flutter_app/flutter_app_main.dart';

void navigateToMiniApp(BuildContext context, MiniAppInfo miniAppInfo){
  if(miniAppInfo.appType =="Web App"){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>WebAppScreen(webAppUrl: miniAppInfo.appLink!,)));
  }else if(miniAppInfo.appType=="Flutter App"){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>FlutterApp(appName: miniAppInfo.appName!,)));
  }
}

class MiniAppDisplay extends StatelessWidget{
  const MiniAppDisplay({super.key, required this.listMiniApp, required this.index});
  final Map<MiniAppInfo,Widget> listMiniApp;
  final int index;

  @override
  Widget build(BuildContext context){
    return InkWell(
      // onTap: (){
      //   Navigator.push(context,MaterialPageRoute(builder: (context)=>listMiniApp.entries.elementAt(index).value));
      // },
      onTap: (){
        navigateToMiniApp(context,listMiniApp.entries.elementAt(index).key);
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
          Text(listMiniApp.entries.elementAt(index).key.appName!,style: const TextStyle(fontSize: 12,color: Colors.black,overflow: TextOverflow.ellipsis),)

        ],
      ),
    );
  }
}