import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/component/bottomAppBar.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:provider/provider.dart';
import 'home_topbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
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

      return Scaffold(

        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
                automaticallyImplyLeading: false,
                stretchTriggerOffset: 100.0,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                leadingWidth: MediaQuery.of(context).size.width,
                leading:_isSliverAppBarExpanded ?  SafeArea(
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width,

                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        // Replace with the actual number of items in your list
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print("click btn on appbar");
                            },
                            child: Container(
                              height: 30,
                              width: 50,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.mapLocationDot,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ): null,
                pinned: true,
                snap: false,
                floating: false,
                stretch: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                flexibleSpace: _isSliverAppBarExpanded ?null : FlexibleSpaceBar(
                  centerTitle: false,
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(70.0),
                      bottomRight: Radius.circular(70.0),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        // color: Theme.of(context).colorScheme.inversePrimary,
                        color: Colors.white,
                      ),
                      child: AppBar(
                        centerTitle: true,
                        leading: null,
                        flexibleSpace: const HomeTopBar(),
                        backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ) ),
            SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            width: 100,
                            height: 80,
                            margin: EdgeInsets.fromLTRB(5,10,5,10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_month,color: Colors.white,size: 35,),
                                Container(
                                  child: Text("Đặt lịch thu gom tại nhà",style: TextStyle(color: Colors.white),),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                )
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(25,30,0,30),
                    child: Text("DANH SÁCH QUÀ ĐỔI ĐIỂM",style: TextStyle(color: Colors.orangeAccent[400],fontSize: 15),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 25, 30),
                    child: Text("Xem tất cả",style: TextStyle(fontSize:15,color: Colors.orangeAccent[400],decoration: TextDecoration.underline,decorationColor: Colors.orangeAccent[400],),),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 250,
                  width: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Set the border radius
                    ),
                    elevation: 5.0, // Set the elevation
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10))
                          // ),
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset('assets/images/homepage-slideshow.jpg',height: 100,fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Thông báo"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child:  Text("0đ"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,

                            ),
                            child: Text(
                              "Xem chi tiết",style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 1,
                  child: PageView(
                    controller: controllerHomePage,
                    // scrollDirection: Axis.horizontal,
                    onPageChanged: (temp) {
                      // print("This is page index $temp");
                      homeViewModal.changeSlide(temp);
                    },
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                            "assets/images/login-slideshow1.jpg"),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                            "assets/images/login-slideshow1.jpg"),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                            "assets/images/login-slideshow1.jpg"),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                            "assets/images/login-slideshow1.jpg"),
                      ),
                    ],
                  )
              ),

            ),
            SliverToBoxAdapter(
              child: Center(
                child: Wrap(
                  children: List.generate(
                    4,
                        (index) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: CircleAvatar(
                          maxRadius: 5,
                          minRadius: 3,
                          // radius: 3,
                          backgroundColor:
                          homeViewModal.currentSlide == index ? Colors.green[500] : Colors.grey,
                        ),
                        // child: Text("hello world"),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[400]!)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(FontAwesomeIcons.bookOpen,color: Colors.blue[400],size: 15,),
                        ),
                        Text("Hướng dẫn",style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            )
          ],
        ),
      );
    });
  }
}
