import 'package:flutter/material.dart';

class VoucherViewModal extends ChangeNotifier{
  int currentVoucherView = 0;
  void changeCurrentVoucherView(){
    if(currentVoucherView ==0){
      currentVoucherView =1;
    }else if(currentVoucherView ==1){
      currentVoucherView =0;
    }
    notifyListeners();
  }
}