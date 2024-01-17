import 'package:flutter/material.dart';

enum GenderType { male, female }
class AccountViewModal extends ChangeNotifier{

  TextEditingController nameTextController = TextEditingController();
  bool nameInputCheck = false;
  TextEditingController contactTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  GenderType? gender = GenderType.male;
  void checkInput (String temp){
    RegExp regex = RegExp(r'^\d{9,10}$');
    if(regex.hasMatch(temp)){
      nameInputCheck = true;
    }
    notifyListeners();
  }
  void setTextDate (String temp){
    dateTextController.text = temp;
    notifyListeners();
  }
  void setGender (GenderType? value){
    gender = value;
    notifyListeners();
  }
}