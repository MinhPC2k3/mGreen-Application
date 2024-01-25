import 'package:flutter/material.dart';
// import 'package:mgreen_app/view/component/CustomCornerClipPath.dart';

class ChangeGarbage extends StatelessWidget {
  const ChangeGarbage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Đổi rác lấy quà',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        // backgroundColor: Colors.grey[300],
        body: Align(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text('Mời bạn mang rác tái chế tới các địa điểm sau để được tích điểm đổi quà',style: TextStyle(color: Colors.black,fontSize: 15,),maxLines: 2,),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text('Danh sách điểm thu mua rác tái chế và đổi quà',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),maxLines: 2,),
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      // margin: EdgeInsets.only(left: 10,right: 10),],
                      width: MediaQuery.of(context).size.width *1,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: const EdgeInsets.all(0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 100,
                            height: 150,

                            child: Image(
                              image: AssetImage('assets/images/login-slideshow.jpg'),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("69 Vọng Hà, Hoàn Kiếm, Hà nội",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.phone, size: 17),
                                        ),

                                        TextSpan(
                                            text: ": 0243723489",style: TextStyle(color: Colors.black)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: const Text("Thời gian hoạt động: ",style: TextStyle(color: Colors.black,fontSize: 15,),),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Thứ Bảy, 8:00 - 11:00",style: TextStyle(color: Colors.black,fontSize: 15),),
                                    Text("Chỉ đường",style: TextStyle(color: Colors.orangeAccent,fontSize: 15),),
                                  ],
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>Container(
                    padding: const EdgeInsets.only(top:15,bottom: 15),
                    child: Divider(
                      height: 5,
                      color: Colors.grey[300],
                      thickness: 5,
                    ),
                  ),
                  itemCount: 4)

            ],

          ),
        )
    );
  }
}
