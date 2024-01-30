import 'package:flutter/material.dart';

class MobileCard extends StatelessWidget{
  final List<String> _priceOfCard =['10.000','20.000','30.000','50.000','100.000','200.000','300.000','500.000'];

  MobileCard({super.key});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.chevron_left, size: 30,color: Colors.white,),
            ),
            title: const Text('Thẻ điện thoại', style: TextStyle(color: Colors.white,fontSize: 20),),
            centerTitle: true,
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.rotate_left,size: 30,color: Colors.white,),
              )
            ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.black,
                    dividerColor: Colors.white,
                    indicatorColor: Colors.green,
                    tabs: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Tab(
                          text: "Nạp tiền",
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Tab(
                          text: "Mua mã thẻ",
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: const Text('Tích điểm: 1%',style: TextStyle(color: Colors.red,fontSize: 20),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10,bottom: 10),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1.0,

                          )
                      ),
                      child: const Text('0912345678',style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 20,
                      padding: const EdgeInsets.all(0),
                      children:  List<Widget>.generate(8, (index) =>
                              Container(
                                  margin: const EdgeInsets.all(0),
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height*0.1,
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                      width: 1.0
                                    )
                                  ),
                                  child: InkWell(
                                      onTap: (){},
                                      // style: TextButton.styleFrom(
                                      //   padding: EdgeInsets.all(0),
                                      //   backgroundColor: Colors.white,
                                      //   shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.all(Radius.circular(5)),
                                      //       side: BorderSide(
                                      //         color: Colors.grey[300]!,
                                      //         width: 1.0,
                                      //       )
                                      //   ),
                                      // ),
                                      child: Center(
                                        child: Text(_priceOfCard[index], style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                      )
                                  )
                              ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:  15),
                      width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: Colors.pink[100],
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text("Tổng tiền:",style: TextStyle(color: Colors.black,fontSize: 20),),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.15,
                          ),
                          Container(

                            child: Text("10.000 đ",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(

                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),

                            )
                        ),
                        child: const Text("Mua hàng", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text("Hello world 1"),
              ),

            ],
          ),
        ),
    );
  }
}