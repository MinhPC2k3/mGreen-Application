import 'package:flutter/material.dart';
import 'package:mgreen_app/view/component/BottomAppBar.dart';
import 'package:mgreen_app/view/screen/Point/point_screen.dart';
import 'package:mgreen_app/view/screen/account/account_screen.dart';
import 'package:mgreen_app/view/screen/home/home_screen.dart';
import 'package:mgreen_app/view/screen/market/market_screen.dart';
import 'package:mgreen_app/view/screen/voucher-screen/voucher_screen.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:provider/provider.dart';

import '../../../model/login_modal.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.userPhoneNumber});
  final String userPhoneNumber;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  // final PageController controllerHomePage = PageController();
  double scrollPosition = 0;
  // double opacityAppBarTitle =0;

  _scrollListener() {
    setState(() {
      scrollPosition = _scrollController.position.pixels;
    });

  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AccountSuperApp>(
        future: postLogin(widget.userPhoneNumber),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            print("User name ${snapshot.data!.userName}");
            return Consumer<HomeViewModal>(builder: (context, homeViewModal, child) {
              List<Widget> widgetOptions = <Widget>[
                PointScreen(),
                const MarketScreen(),
                HomeScreen(userPhoneNumber: widget.userPhoneNumber,),
                VoucherScreen(homeViewModal: homeViewModal,),
                const AccountScreen(),

              ];
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                floatingActionButton: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    elevation: 0,
                    onPressed: () {
                      homeViewModal.changePage(2);
                    },

                    child: CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/mgreen-icon.jpg'),
                    ),
                    //const Icon(Icons.add)
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 1.0))),
                  child: BottomCustomAppBar(
                    homeViewModal: homeViewModal,
                  ),
                ),
                body: IndexedStack(
                  index: homeViewModal.currentScreenView,
                  children: widgetOptions,
                ),
              );
            });
          }
        }
    );
  }
}
