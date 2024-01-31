import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
class BottomCustomAppBar extends StatelessWidget{
  final HomeViewModal homeViewModal;
  const BottomCustomAppBar({super.key,required this.homeViewModal});

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      currentIndex: homeViewModal.currentScreenView,
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Colors.white,
      onTap: (int index){
        homeViewModal.changePage(index);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.tags,),
          label: 'Tích điểm',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.bagShopping),
          label: 'Siêu thị quà',
        ),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/logomgreen.png')),
            label: '',
        ),

        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.gift),
          label: 'Của tôi',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: 'Tài khoản',
        ),



      ],
    );
  }
}