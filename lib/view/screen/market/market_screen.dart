import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/component/cardImgae.dart';
import 'package:mgreen_app/view_model/market_viewModal.dart';

class MarketScreen extends StatelessWidget{
  MarketScreen({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Theme.of(context).primaryColor, Theme.of(context).colorScheme.inversePrimary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: const Icon(FontAwesomeIcons.arrowLeft,color: Colors.white,),
        title: SizedBox(
          height: 50,
          child: TextField(

            controller: _searchController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            maxLines: 1,

            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border:  InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
              prefixIcon: Icon(Icons.search),


            ),
            onChanged: (value) {
              // Perform search functionality here
            },
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.wallet_giftcard_sharp,color: Colors.white,),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context,int index1){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(MarketViewModal.listCardTitle[index1],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text("Xem tất cả", style: TextStyle(fontSize: 12,color: Colors.grey),),
                    )

                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.33,
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context , int index){
                        return Container(
                          height: MediaQuery.of(context).size.height*0.3,
                          width: MediaQuery.of(context).size.width*0.6,
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: CardImage(
                            borderRadius: 10,
                            imageProvider: AssetImage(MarketViewModal.listCardImage[index1]),
                            width: MediaQuery.of(context).size.width*0.6,
                            children: [
                              Container(
                                // height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hoàng Ngân Spa", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                                    Text("Vourcher giảm giá 10% trên tổng hóa đơn tại thương hiệu chính hãng ",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                                    TextButton(onPressed: (){}, child: Text("Miên phí",style: TextStyle(color: Colors.blueAccent),)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                )
              ],
            );
          }
      )
    );
  }
}