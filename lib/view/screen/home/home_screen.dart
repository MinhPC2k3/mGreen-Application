import 'package:connection_standard_package/connection_standard_package.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/screen/home/change_garbice.dart';
import 'package:mgreen_app/view/screen/home/gift_from_point_screen.dart';
import 'package:mgreen_app/view/screen/home/home_question_screen.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:minh_weather_app/app.dart';
import 'package:provider/provider.dart';
import 'home_topbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ConnectionStandard connectionStandard = ConnectionStandard(userID: 1,  isOpenMiniApp: true);
  scrollListener() {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });

  }

  @override
  void initState() {
    scrollController.addListener(scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeViewModal>(builder: (context, homeViewModal, child) {

      return FutureBuilder(
          future: localPath,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Scaffold(

                body: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                        automaticallyImplyLeading: false,
                        stretchTriggerOffset: 100.0,
                        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                        leadingWidth: MediaQuery.of(context).size.width,
                        leading:isSliverAppBarExpanded ?  SafeArea(
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
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 6,
                                // Replace with the actual number of items in your list
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: const Center(
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
                        flexibleSpace: isSliverAppBarExpanded ?null : FlexibleSpaceBar(
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
                          margin: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (BuildContext context,int index){
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangeGarbage()));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 80,
                                      margin: const EdgeInsets.fromLTRB(5,10,5,10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blueAccent,

                                      ),
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.calendar_month,color: Colors.white,size: 35,),
                                          Text("Đặt lịch thu gom tại nhà",style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
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
                            padding: const EdgeInsets.fromLTRB(25,30,0,30),
                            child: Text("DANH SÁCH QUÀ ĐỔI ĐIỂM",style: TextStyle(color: Colors.orangeAccent[400],fontSize: 15),),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 30, 25, 30),
                            child: Text("Xem tất cả",style: TextStyle(fontSize:15,color: Colors.orangeAccent[400],decoration: TextDecoration.underline,decorationColor: Colors.orangeAccent[400],),),
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 15),
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
                                SizedBox(
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.all(Radius.circular(10))
                                  // ),
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset('assets/images/homepage-slideshow.jpg',height: 100,fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const Text("Thông báo"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child:  const Text("0đ"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const GiftFromPoint()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,

                                    ),
                                    child: const Text(
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
                      child: SizedBox(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return index == 2 ? InkWell(
                            onTap: (){
                              connectionStandard.navigateToMiniApp(context, WeatherApp(navigateBackBtn: IconButton(icon: Icon(Icons.chevron_left,size: 20,),onPressed: (){Navigator.pop(context);},),));
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[100],
                                  border: Border.all(color: Colors.blue[400]!)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(FontAwesomeIcons.cloud,color: Colors.blue[400],size: 15,),
                                  ),
                                  const Text("Thời tiết",style: TextStyle(color: Colors.black),),
                                ],
                              ),
                            ),
                          ): InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeQuestion()));
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[100],
                                  border: Border.all(color: Colors.blue[400]!)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(FontAwesomeIcons.bookOpen,color: Colors.blue[400],size: 15,),
                                  ),
                                  const Text("Hướng dẫn",style: TextStyle(color: Colors.black),),
                                ],
                              ),
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
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      );
    });
  }
}
