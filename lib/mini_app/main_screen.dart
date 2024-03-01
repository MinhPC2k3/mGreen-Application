import 'package:flutter/material.dart';
// import 'package:mgreen_app/data/mini_app_infor_data_source.dart';
import 'package:minh_weather_app/app.dart';
import 'package:connection_standard_package/connection_standard_package.dart';
import 'package:http/http.dart' as http;
import '../connection_standard/connection_model.dart';
import '../connection_standard/mini_app_container.dart';
import '../connection_standard/mini_app_handle_display.dart';
import '../view/screen/Point/mobile_card_screen.dart';
import 'baomoi_webapp/baomoi_main .dart';


class MiniAppScreen extends StatefulWidget{
  const MiniAppScreen({super.key});

  @override
  State<MiniAppScreen> createState() => _MiniAppScreenState();
}

class _MiniAppScreenState extends State<MiniAppScreen> {
  // final List<String> logoLeaguePath=[ 'assets/images/football/league-2.png', 'assets/images/football/league-135.png', 'assets/images/football/league-61.png', 'assets/images/football/league-39.png', 'assets/images/football/league-4.png', 'assets/images/football/league78.png'];
  final ConnectionStandard connectionStandard = ConnectionStandard(userID: 1,  isOpenMiniApp: true);

  late List<Widget> listWidget;

  @override
  void initState(){
    super.initState();
    listWidget=[MobileCard(),WeatherApp(constructorConnectionStandard: connectionStandard),const BaomoiHomeScreen()];
    print('Original list: ${listWidget.length}');
  }

  // final miniAppClient = MiniAppClient();
  @override
  Widget build(BuildContext context){

    return FutureBuilder<Map<MiniAppInfo,Widget>>(
        future: initMapMiniApp(listWidget),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            // print("mini app name ${snapshot.data![0].appName}");
            // miniAppContainer.listMiniApp = snapshot.data!;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Live Score", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.12,
                      width: double.infinity,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(

                        gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.blue[100]!],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return MiniAppDisplay(listMiniApp: snapshot.data!, index: index,);
                          // return InkWell(
                          //   onTap: () =>{
                          //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> const WeatherApp())),
                          //     connectionStandard.navigateToMiniApp(context, WeatherApp(constructorConnectionStandard: connectionStandard)),
                          //   },
                          //   child: Container(
                          //     margin: const EdgeInsets.all(5),
                          //     padding: EdgeInsets.all(0),
                          //     child: CircleAvatar(
                          //       maxRadius: 35,
                          //       backgroundColor: Colors.white,
                          //       child: SizedBox(
                          //         height: 40,
                          //         width: 40,
                          //         child: Image.asset(logoLeaguePath[index],fit: BoxFit.contain,),
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }
    );
  }
}