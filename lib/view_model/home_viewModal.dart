// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../model/login_modal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final ScrollController scrollController = ScrollController();
final PageController controllerHomePage = PageController();
double scrollPosition = 0;
const storage = FlutterSecureStorage();

class HomeViewModal extends ChangeNotifier{
  final ScrollController scrollController = ScrollController();
  final PageController controllerHomePage = PageController();
  double opacityAppBarTitle =0;
  int currentScreenView=2;
  double opacityOfAppBarTitle = 0;
  int currentSlide =0;
  int giftNumber =1;
  void handleChangeGiftNumber(int temp){
    if(giftNumber>0 && temp ==1){
      giftNumber--;
      notifyListeners();
    }else if(temp==0){
      giftNumber++;
      notifyListeners();
    }
  }
  void changePage(int index){
    currentScreenView = index;
    notifyListeners();
  }
  void changeSlide(int index){
    currentSlide = index;
    notifyListeners();
  }
  void opacityChange(double scrollNumber) {
    if (100 <= scrollNumber && scrollNumber < 200) {
      opacityOfAppBarTitle = ((scrollNumber - 100) / 100);
      notifyListeners();
      return;
    }
    opacityOfAppBarTitle = 1;
    notifyListeners();
    return;
  }


}

Future<AccountSuperApp> postLogin(String userPhoneNumber) async{
  print("this user phone num $userPhoneNumber");
  Map<String,dynamic> postBody = {
    "PhoneNumber" : userPhoneNumber,
  };
  final response = await http.post(Uri.parse(getAuthenToken),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },body: jsonEncode(postBody));
  await storage.write(key: "JwtKey", value: response.headers["authorization"]);

  if(response.statusCode == 200){
    print("Jwt key :${response.headers["authorization"]}");
    print("user name from server ${AccountSuperApp.fromJson(jsonDecode(response.body)).userName}");
    return AccountSuperApp.fromJson(jsonDecode(response.body));
  }else{
    print("error: ${response.statusCode}");
    throw Exception("Empty return from api");
  }
}

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

bool get isSliverAppBarExpanded {
  return scrollController.hasClients &&
      scrollController.offset > (200 - kToolbarHeight);
}


