import 'package:flutter/material.dart';
import 'package:mgreen_app/view/component/BottomAppBar.dart';
import 'package:mgreen_app/view/screen/Point/point_screen.dart';
import 'package:mgreen_app/view/screen/account/account_screen.dart';
import 'package:mgreen_app/view/screen/home/home_screen.dart';
import 'package:mgreen_app/view/screen/market/market_screen.dart';
import 'package:mgreen_app/view/screen/voucher-screen/voucher_screen.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final PageController controllerHomePage = PageController();
  double _scrollPosition = 0;
  double opacityAppBarTitle =0;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });

  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    print("This is position $_scrollPosition");
    super.initState();
  }
  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModal>(builder: (context, homeViewModal, child) {
      List<Widget> widgetOptions = <Widget>[
        PointScreen(),
        MarketScreen(),
        const HomeScreen(),
        VoucherScreen(homeViewModal: homeViewModal,),
        AccountScreen(),

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
