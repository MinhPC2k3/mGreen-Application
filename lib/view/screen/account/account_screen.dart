import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/screen/account/account_form.dart';
import 'package:mgreen_app/view_model/account_viewModal.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModal>(
        builder: (context,accountViewModal,child){
          return Scaffold(
              drawerEnableOpenDragGesture: true,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                // leading: const Icon(
                //   FontAwesomeIcons.bars,
                //   color: Colors.white,
                // ),
                title: const Text(
                  "Thông tin của bạn",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              backgroundColor: Colors.grey[300],
              drawer: Drawer(
                width: MediaQuery.of(context).size.width * 0.7,
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ứng dụng phân loại rác tại nguồn được tích điểm, đổi quà',style: TextStyle(color: Colors.white,fontSize: 13),maxLines: 2,)

                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('Về mGreen'),
                      selected: _selectedIndex == 0,
                      onTap: () {
                        // Update the state of the app
                        _onItemTapped(0);
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Lịch sử'),
                      selected: _selectedIndex == 1,
                      onTap: () {
                        // Update the state of the app
                        _onItemTapped(1);
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.arrowRightFromBracket),
                      title: const Text('Đăng xuất'),
                      selected: _selectedIndex == 2,
                      onTap: () {
                        // Update the state of the app
                        _onItemTapped(2);
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              body: AccountForm(accountViewModal: accountViewModal,)
          );
        }
    );
  }
}
