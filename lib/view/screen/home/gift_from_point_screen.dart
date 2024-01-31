
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:provider/provider.dart';

class GiftFromPoint extends StatefulWidget {
  const GiftFromPoint({super.key});

  @override
  State<GiftFromPoint> createState() => _GiftFromPointState();
}

class _GiftFromPointState extends State<GiftFromPoint> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModal>(builder: (context, homeViewModal, child) {
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Chi tiết quà đổi điểm',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                FontAwesomeIcons.cartShopping,
                size: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent[100]!,
                    Colors.lightBlueAccent[100]!
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          'mGreen - Thành phố Huế',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 25, left: 10),
                        child: const Image(
                          image: AssetImage('assets/images/logomgreen.png'),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const Text(
                      "Giảm giá lên tới 50% quà tặng tại Siêu thị quà trên app mGreen",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Thông báo",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "Đổi điểm: ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          TextSpan(
                              text: "0", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,0,10,15),
              child: Divider(
                height: 5,
                color: Colors.grey[300],
                thickness: 5,
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Thời gian hết hạn: ",
                      style:
                      TextStyle(color: Colors.black, fontSize: 14)),
                  TextSpan(
                      text: "06/01/2024",
                      style:
                      TextStyle(color: Colors.red, fontSize: 17)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,15,10,10),
              child: Divider(
                height: 5,
                color: Colors.grey[300],
                thickness: 5,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10,bottom: 20),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Số lượng: "),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.grey[300]!)
                          ),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(0)
                      ),
                      onPressed: (){
                        homeViewModal.handleChangeGiftNumber(1);
                      },
                      child: const Icon(FontAwesomeIcons.minus,color: Colors.black,size: 10,),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Center(
                      child: Text("${homeViewModal.giftNumber}"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.grey[300]!)
                          ),
                          backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(0)
                      ),
                      onPressed: (){
                        homeViewModal.handleChangeGiftNumber(0);
                      },
                      child: const Icon(FontAwesomeIcons.plus,color: Colors.black,size: 10),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Số lượng còn: ${homeViewModal.giftNumber}"),
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(10)

                    ),
                    onPressed: () {},
                    child: const Text(
                      'Thêm giỏ hàng',
                      style: TextStyle(fontSize: 15,color:Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(10)
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Đổi ngay',
                      style: TextStyle(fontSize: 15,color:Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
