import 'package:flutter/material.dart';
import 'package:mgreen_app/view/component/StackContent.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:mgreen_app/view_model/voucher_viewModal.dart';
import 'package:provider/provider.dart';

class VoucherScreen extends StatefulWidget {
  final HomeViewModal homeViewModal;

  const VoucherScreen({super.key, required this.homeViewModal});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<VoucherViewModal>(
        builder: (context,voucherViewModal ,child){
          return DefaultTabController(
            length: 2,
            initialIndex: 0,

            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: const Text(
                    "Quà của tôi",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  leading: InkWell(
                    onTap: () {
                      widget.homeViewModal.changePage(2);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.orange,
                        unselectedLabelColor: Theme.of(context).primaryColor,
                        dividerColor: Colors.white,
                        indicatorColor: Colors.orange,
                        tabs: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Tab(
                              text: "Voucher mGreen",
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Tab(
                              text: "Voucher đổi quà",
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              body: TabBarView(
                children: [
                  IndextedStackContent(
                    screenIndex: voucherViewModal.currentVoucherView,
                    screenContent: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(

                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: voucherViewModal.currentVoucherView==0 ? Colors.green : Colors.white,
                                    textStyle: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green,),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                    )

                                  ),
                                  child: Text("Vochers đã lấy",style: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green),),

                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(

                                      backgroundColor: voucherViewModal.currentVoucherView==1 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==1 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Tất cả vouchers",style: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.green : Colors.white),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top:10),
                            child:const Center(
                              child: Text("Hello", style: TextStyle(color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: voucherViewModal.currentVoucherView==0 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Vochers đã lấy",style: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green),),

                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: voucherViewModal.currentVoucherView==1 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==1 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Tất cả vouchers",style: TextStyle(color: voucherViewModal.currentVoucherView==1 ? Colors.white : Colors.green),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top:10),
                            child: const Center(
                              child: Text("Hello1", style: TextStyle(color: Colors.black)),
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                  IndextedStackContent(
                    screenIndex: voucherViewModal.currentVoucherView,
                    screenContent: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(

                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: voucherViewModal.currentVoucherView==0 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Vochers đã lấy",style: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green),),

                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(

                                      backgroundColor: voucherViewModal.currentVoucherView==1 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==1 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Tất cả vouchers",style: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.green : Colors.white),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top:10),
                            child:const Center(
                              child: Text("Helloabc", style: TextStyle(color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: voucherViewModal.currentVoucherView==0 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Vochers đã lấy",style: TextStyle(color: voucherViewModal.currentVoucherView==0 ? Colors.white : Colors.green),),

                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    voucherViewModal.changeCurrentVoucherView();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: voucherViewModal.currentVoucherView==1 ? Colors.green : Colors.white,
                                      textStyle: TextStyle(color: voucherViewModal.currentVoucherView==1 ? Colors.white : Colors.green,),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      )

                                  ),
                                  child: Text("Tất cả vouchers",style: TextStyle(color: voucherViewModal.currentVoucherView==1 ? Colors.white : Colors.green),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top:10),
                            child: const Center(
                              child: Text("Helloabc1", style: TextStyle(color: Colors.black)),
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
