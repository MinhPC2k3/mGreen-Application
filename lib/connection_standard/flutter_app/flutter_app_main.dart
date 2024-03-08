import 'package:flutter/material.dart';
import 'package:minh_weather_app/app.dart';

import '../../view/screen/Point/mobile_card_screen.dart';

class FlutterApp extends StatelessWidget{
  const FlutterApp({super.key, required this.appName});
  final String appName;
  @override
  Widget build(BuildContext context){
    switch(appName){
      case "Thời tiết":
        return WeatherApp(navigateBackBtn: IconButton(icon: const Icon(Icons.chevron_left,size: 20,),onPressed: (){Navigator.pop(context);},),);

      case "Thẻ Điện Thoại":
        return MobileCard();
      default:
        return  const Center(child: Text("App do not define"),);

    }
  }
}