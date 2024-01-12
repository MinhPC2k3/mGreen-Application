import 'package:flutter/material.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';

class VoucherScreen extends StatefulWidget{
  final HomeViewModal homeViewModal;
  const VoucherScreen({super.key,required this.homeViewModal});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context){
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Quà của tôi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
            leading: InkWell(
              onTap: (){
                widget.homeViewModal.changePage(2);
              },
              child: const Icon(Icons.arrow_back,color: Colors.white,size: 20,),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            bottom: PreferredSize(

              preferredSize:  Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.orange,
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  dividerColor: Colors.white,
                  indicatorColor: Colors.orange,
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Tab(text: "Voucher mGreen",),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Tab(text: "Voucher đổi quà",),
                    ),
                  ],
                ),
              ),
            )
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children:[
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Theme.of(context).primaryColor),borderRadius: BorderRadius.circular(15)),
                        backgroundColor: _tabController.index %2==0 ? Theme.of(context).primaryColor : Colors.white,
                        onPressed: (){
                          _tabController.animateTo(0);
                          print("this is button tapped index ${_tabController.index}");
                        },

                        child: _tabController.index %2==0 ? Text("Vouchers đã lấy" ,style: TextStyle(color: Colors.white),) : Text("Vouchers đã lấy",style: TextStyle(color: Theme.of(context).primaryColor),),
                      ),
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Theme.of(context).primaryColor),borderRadius: BorderRadius.circular(15)),
                        backgroundColor: _tabController.index %2==1 ?  Colors.white : Theme.of(context).primaryColor ,
                        onPressed: (){
                          _tabController.animateTo(1);
                          print("this is button tapped index ${_tabController.index}");
                        },

                        child: _tabController.index %2==0 ? Text("Tất cả vouchers",style: TextStyle(color: Theme.of(context).primaryColor),) : Text("Tất cả vouchers" ,style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                  Center(
                    child: Text("Không có voucher nào !",style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Không có voucher đổi quà nào !",style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}