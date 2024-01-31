// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

final ScrollController scrollController = ScrollController();
final PageController controllerHomePage = PageController();
double scrollPosition = 0;

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

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

bool get isSliverAppBarExpanded {
  return scrollController.hasClients &&
      scrollController.offset > (200 - kToolbarHeight);
}


