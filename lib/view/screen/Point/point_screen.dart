import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/screen/Point/save_point_screen.dart';

import '../../../view_model/point_viewModal.dart';

class PointScreen extends StatelessWidget {
  PointScreen({super.key});

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final listMiniApp = ListMiniApp();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.inversePrimary
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: const Icon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: const TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              // Perform search functionality here
            },
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.wallet_giftcard_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(

        children: [
          Container(
            color: Colors.white,
            child: listMiniApp.displayMiniAppBtn(context),
            // height: MediaQuery.of(context).size.height * 0.7,
            // child: GridView.builder(
            //   shrinkWrap: true,
            //   itemCount: 16,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //   ),
            //   itemBuilder: (BuildContext context, int index) {
            //     // pointScreenViewModal.getButton(index, context);
            //     return pointScreenViewModal.getButton(index, context);
            //   },
            // ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            // height: MediaQuery.of(context).size.height*0.6,
            color: Colors.white,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return index ==0 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: const Text('Đối tác tích điểm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: const Text("Xem tất cả", style: TextStyle(fontSize: 12,color: Colors.grey),),
                    )

                  ],
                ) : InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SavePoint()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height:70,
                            width:70,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.grey),
                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              child: Image(
                                image: AssetImage('assets/images/Shopee-logo.jpg'),
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text('Shopee',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Tích điểm",style: TextStyle(color: Colors.purpleAccent,fontSize: 15),),
                          Text("10%",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17),),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
