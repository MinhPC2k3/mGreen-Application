import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import 'connection_model.dart';

// Map<MiniAppInfor,Widget>? listMiniApp;

// Future<List<MiniAppInfo>> getMiniAppInfo () async{
//   var uri = Uri.parse(miniAppUrl);
//   var response = await http.get(uri);
//   if (response.statusCode == 200) {
//     return compute(parseInfo,response.body);
//   }else {
//     throw Exception('Failed to load album');
//   }
// }

List<MiniAppInfo> parseInfo(String responseBody){
  final parse = (jsonDecode(responseBody) as List).cast<Map<String,dynamic>>();
  return parse.map<MiniAppInfo>((json) => MiniAppInfo.fromJson(json)).toList();
}
Future<Map<MiniAppInfo,Widget>> initMapMiniApp(List<Widget> listWidget) async{
  var uri = Uri.parse(miniAppUrl);
  var response = await http.get(uri);
  print("doing2");
  Map<MiniAppInfo,Widget> temp = {};
  List<MiniAppInfo> listAppInfo=[];
  if(response.statusCode == 200){
    print("doing0");
    listAppInfo = await compute(parseInfo,response.body);
    print("doing1");
  }else {
    throw Exception('Failed to call api');
  }
  print("doing");
  for (var i in listAppInfo){
    temp.addEntries([
      MapEntry(i,listWidget.elementAt(listAppInfo.indexOf(i))),
    ]);
  }
  print("doing3");
  return temp;
}
  // Future<Map<MiniAppInfor, Widget>> initMapMiniApp (List<Widget> listWidget) async{
  //   var uri = Uri.parse(miniAppUrl);
  //   var response = await http.get(uri);
  //   List<MiniAppInfor>? listMiniAppInfo;
  //   if (response.statusCode == 200) {
  //     listMiniAppInfo = compute(parseInfo,response.body) as List<MiniAppInfor>?;
  //   }else {
  //     throw Exception('Failed to load album');
  //   }
  //   Map<MiniAppInfor,Widget> temp =[] as Map<MiniAppInfor, Widget>;
  //   print("Hello");
  //   for(var i in listWidget){
  //     print("this object ${listMiniAppInfo!.elementAt(listWidget.indexOf(i)).appName}");
  //     temp.addEntries([
  //       MapEntry(listMiniAppInfo.elementAt(listWidget.indexOf(i)),i),
  //     ]);
  //   }
  //   return temp;
  // }