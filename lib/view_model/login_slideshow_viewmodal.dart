import 'package:flutter/cupertino.dart';

class LoginSlideShowViewModal extends ChangeNotifier{
  final PageController controller = PageController();
  int currentPageView=0;
  bool checkValidInput = false;
  TextEditingController inputController = TextEditingController();
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
}