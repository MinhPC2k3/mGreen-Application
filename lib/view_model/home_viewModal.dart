import 'package:flutter/cupertino.dart';

class HomeViewModal extends ChangeNotifier{
  int currentScreenView=2;
  double opacityOfAppBarTitle = 0;
  int currentSlide =0;
  void changePage(int index){
    currentScreenView = index;
    notifyListeners();
  }
  void changeSlide(int index){
    currentSlide = index;
    notifyListeners();
  }
  void opacityChange(double scrollNumber){

    if(100<=scrollNumber && scrollNumber<200){
      opacityOfAppBarTitle = ((scrollNumber-100)/100);
      notifyListeners();
      return;
    }
    opacityOfAppBarTitle =1;
    notifyListeners();
    return;

  }

}