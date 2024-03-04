import 'package:flutter/material.dart';
import 'package:minh_weather_app/app.dart';

class FlutterApp extends StatelessWidget{
  const FlutterApp({super.key, required this.appName});
  final String appName;
  @override
  Widget build(BuildContext context){
    return Container(
      child: appName =="Thời tiết" ? WeatherApp(navigateBackBtn: IconButton(icon: Icon(Icons.chevron_left,size: 20,),onPressed: (){Navigator.pop(context);},),) : Center(child: Text("App do not define"),),
    );
  }
}