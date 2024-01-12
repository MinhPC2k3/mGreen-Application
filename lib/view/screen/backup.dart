// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:mgreen_app/view/component/bottomAppBar.dart';
// import 'package:mgreen_app/view_model/home_viewModal.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   ScrollController _scrollController = ScrollController();
//
//   double _scrollPosition = 0;
//
//   _scrollListener() {
//     setState(() {
//       _scrollPosition = _scrollController.position.pixels;
//     });
//   }
//
//   @override
//   void initState() {
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeViewModal>(builder: (context, homeViewModal, child) {
//       return Scaffold(
//         // appBar: AppBar(title: Text("Hello world"),),
//         appBar: _scrollPosition == 0
//             ? PreferredSize(
//           preferredSize:
//           Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
//           child: AppBar(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)),
//             ),
//             centerTitle: true,
//             leading: null,
//             flexibleSpace: SafeArea(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width * 1,
//                       height: MediaQuery.of(context).size.width * 0.2,
//                       margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                       padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
//                             child: const Icon(Icons.list),
//                           ),
//                           CircleAvatar(
//                             child:
//                             Image.asset('assets/images/mgreen-icon.jpg'),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             child: const Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Chưa đặt tên'),
//                                 Text('30 Điểm'),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                             child: const Icon(FontAwesomeIcons.user),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                             child: const Icon(FontAwesomeIcons.bell),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                             child: const Icon(FontAwesomeIcons.cartShopping),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: 150,
//                       child: Center(
//                         child: ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemCount: 4,
//                           // Replace with the actual number of items in your list
//                           itemBuilder: (context, index) {
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     print("click btn on appbar");
//                                   },
//                                   child: Container(
//                                     height: 60,
//                                     width: 60,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(20)),
//                                     ),
//                                     margin:
//                                     EdgeInsets.fromLTRB(10, 10, 10, 10),
//                                     child: Center(
//                                       child: Icon(
//                                         FontAwesomeIcons.mapLocationDot,
//                                         color: Theme.of(context).primaryColor,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 60,
//                                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Center(
//                                     child: Text(
//                                       "Ưu đãi quanh đây",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 13),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//             backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           ),
//         )
//             : AppBar(
//           leading: null,
//           title: const Text('2nd AppBar'),
//           backgroundColor: Colors.blue,
//         ),
//         floatingActionButton: Container(
//           height: 70,
//           width: 70,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//           ),
//           child: FloatingActionButton(
//             shape: const CircleBorder(),
//             elevation: 0,
//             onPressed: () {},
//             child: CircleAvatar(
//               radius: 20,
//               child: Image.asset('assets/images/mgreen-icon.jpg'),
//             ),
//             //const Icon(Icons.add)
//           ),
//         ),
//
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: Container(
//           decoration: const BoxDecoration(
//               border: Border(top: BorderSide(color: Colors.grey, width: 1.0))),
//           child: CustomAppBar(
//             homeViewModal: homeViewModal,
//           ),
//         ),
//         body: ListView.builder(
//           controller: _scrollController,
//           itemCount: 20,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text('Item: $index'),
//             );
//           },
//         ),
//       );
//     });
//   }
// }
// // CustomScrollView(
// // slivers: [
// // SliverAppBar(
// // flexibleSpace: FlexibleSpaceBar(
// // title: Container(
// // child: Row(
// // children: [
// // Icon(Icons.list),
// // CircleAvatar(
// // child: Image.asset('assets/images/mgreen-icon.jpg'),
// // ),
// // Container(
// // width: MediaQuery.of(context).size.width * 0.5,
// // child: Column(
// // children: [
// // Text('Chưa đặt tên'),
// // Text('30 Điểm'),
// // ],
// // ),
// // ),
// // Icon(FontAwesomeIcons.user),
// // Icon(FontAwesomeIcons.bell),
// // Icon(FontAwesomeIcons.cartShopping),
// //
// //
// // ],
// // ),
// // ),
// // ),
// // ),
// // Center(
// // child: Text("Feature comming soon"),
// // ),
// // ],
// // )
