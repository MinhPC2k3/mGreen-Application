import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/component/CardImgae.dart';
import 'package:mgreen_app/view_model/market_viewModal.dart';

class MarketScreen extends StatelessWidget{
  const MarketScreen({super.key});

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

            controller: MarketViewModal.searchController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            maxLines: 1,

            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: const TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border:  InputBorder.none,
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
            child: const Icon(Icons.wallet_giftcard_sharp,color: Colors.white,),
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(MarketViewModal.listCardTitle[index1],style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: const Text("Xem tất cả", style: TextStyle(fontSize: 12,color: Colors.grey),),
                    )

                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.33,
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context , int index){
                        return Container(
                          height: MediaQuery.of(context).size.height*0.3,
                          width: MediaQuery.of(context).size.width*0.6,
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                                    const Text("Hoàng Ngân Spa", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                                    const Text("Vourcher giảm giá 10% trên tổng hóa đơn tại thương hiệu chính hãng ",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                                    TextButton(onPressed: (){}, child: const Text("Miên phí",style: TextStyle(color: Colors.blueAccent),)),
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