import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mgreen_app/config/config.dart';
import '../model/login_modal.dart';

class LoginSlideShowViewModal extends ChangeNotifier{
  final PageController controller = PageController();
  int currentPageView=0;
  bool checkValidInput = false;
  TextEditingController inputController = TextEditingController();
  late AccountSuperApp accountSuperApp;
  void changePage (int index){
    currentPageView = index;
    notifyListeners();

  }
  void checkInput (String temp){
    RegExp regex = RegExp(r'^\d{9,10}$');
    if(regex.hasMatch(temp)){
      checkValidInput = true;
    }
    notifyListeners();
  }


  // Future<AccountSuperApp?> postLogin() async{
  //   Map<String,dynamic> postBody = {
  //     "PhoneNumber" : inputController.text,
  //   };
  //   final response = await http.post(Uri.parse(getAuthenToken),body: jsonEncode(postBody));
  //   if(response.statusCode == 200){
  //     print("user name from server ${AccountSuperApp.fromJson(jsonDecode(response.body)).userName}");
  //     return AccountSuperApp.fromJson(jsonDecode(response.body));
  //   }else{
  //     print("error: ${response.statusCode}");
  //   }
  //   return null;
  // }


}