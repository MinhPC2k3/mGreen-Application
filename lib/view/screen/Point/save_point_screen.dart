import 'package:flutter/material.dart';

class SavePoint extends StatelessWidget{
  const SavePoint({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left, size: 30,color: Colors.white,),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Tích điểm',style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.11,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text('Số điểm đang có', style: TextStyle(color: Colors.black, fontSize: 15),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text('30', style:  TextStyle(color: Theme.of(context).primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                TextButton(
                    onPressed: (){},
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )
                  ),
                    child: const Text('NẠP THÊM',style: TextStyle(color: Colors.white, fontSize: 15,),),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Đưa mã này cho thu ngân',style: TextStyle(color: Colors.black,fontSize: 15,),),
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Image(
                    image: const AssetImage('assets/images/column_code.png'),
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.15,
                    fit: BoxFit.cover,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        text: '4093*****',
                        style: const TextStyle(fontSize: 15),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Xem mã',
                            style: TextStyle(fontSize: 15,color:Theme.of(context).primaryColor),
                          )
                        ]
                    ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Image(
                    image: const AssetImage('assets/images/qr_example.png'),
                    width: MediaQuery.of(context).size.width*0.2,
                    height: MediaQuery.of(context).size.width*0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Tự cập nhật mã sau 58 giây',style: TextStyle(color: Colors.black,fontSize: 15,),),
                Text('Cập nhật',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,),),

              ],
            ),
          ),
          Container(
                height: MediaQuery.of(context).size.height*0.8,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(0),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image(
                      image: const AssetImage('assets/images/gift_img.jpeg'),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.3,
                      fit: BoxFit.cover,
                    ),
                    // ClipRRect(borderRadius: BorderRadius.circular(25), child: Image.asset('assets/images/gift_img.jpeg')),
                    Positioned(
                      bottom: -MediaQuery.of(context).size.height*0.3,
                      // right: 20,
                      // left: 20,
                      child: Container(
                        // height: 150,
                        width: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text("Ra mắt năm 2015, nền tảng thương mại Shopee được xây dựng nhằm cung cấp cho người dùng những trải nghiệm dễ dàng, an toàn và nhanh chóng khi mua sắm trực tuyến thông qua hệ thống hỗ trợ thanh toán và vận hành vững mạnh.Chúng tôi có niềm tin mạnh mẽ rằng trải nghiệm mua sắm trực tuyến phải đơn giản, dễ dàng và mang đến cảm xúc vui thích. ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: TextStyle(fontSize: 15,color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10,bottom: 10),
                              child: const Divider(),
                            ),
                            Container(
                              child: const Text('Danh sách cửa hàng',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: const Text('1',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Đài truyền hình K2V',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                    const Text('Các đối tác liên kết tích điểm mPoint',style: TextStyle(fontSize: 15,color: Colors.black),),
                                    Text('0912345678',style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }
}