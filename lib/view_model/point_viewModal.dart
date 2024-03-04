import 'package:connection_standard_package/connection_standard_package.dart';
import 'package:flutter/material.dart';
import 'package:minh_weather_app/app.dart';

import '../mini_app/baomoi_webapp/baomoi_main .dart';
import '../view/screen/Point/mobile_card_screen.dart';

class PointViewModal {
  Widget getButton (int index, BuildContext context){
    switch(index){
      case 0:
        return InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const BaomoiHomeScreen()));
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
                child: Image.asset('assets/images/newspaper.png'),
              ),
              const Text('Báo mới',style: TextStyle(fontSize: 12,color: Colors.black),)

            ],
          ),
        );
        break;
      case 1:
        ConnectionStandard connectionStandard =  ConnectionStandard(userID: 1,  isOpenMiniApp: true);
        return InkWell(
          onTap: (){
            connectionStandard.navigateToMiniApp(context, WeatherApp(navigateBackBtn: IconButton(icon: Icon(Icons.chevron_left,size: 20,),onPressed: (){Navigator.pop(context);},),));
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
                child: Image.asset('assets/images/weather-news.png'),
              ),
              const Text('Thẻ điện thoại',style: TextStyle(fontSize: 12,color: Colors.black),)

            ],
          ),
        );
        break;
      default: return InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>MobileCard()));
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
              child: Image.asset('assets/images/cashless-payment.png'),
            ),
            const Text('Thẻ điện thoại',style: TextStyle(fontSize: 12,color: Colors.black),)

          ],
        ),
      );
    }
  }
}