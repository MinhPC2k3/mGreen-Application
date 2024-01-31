import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../component/ResizableText.dart';

class VoucherMarketDetail extends StatelessWidget {
  const VoucherMarketDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        appBar: null,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image(
                          image: const AssetImage(
                              'assets/images/homepage-slideshow1.jpg'),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(5),
                                backgroundColor: Colors.transparent,
                              ),
                              child: const Icon(
                                FontAwesomeIcons.arrowLeft,
                                size: 20,
                                color: Colors.white,
                              )),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              '1/1',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ),
            const SliverAppBar(
              pinned: true,
              // snap: _snap,
              // floating: _floating,
              automaticallyImplyLeading: false,
              // expandedHeight: 160.0,
              title: Text(
                'Voucher giảm giá 10% trên tổng giá trị hóa đơn tại thương hiệu Hoàng Ngân spa',
                maxLines: 2,
                style: TextStyle(fontSize: 17),
              ),
              // flexibleSpace: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('Miễn phí', style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17),)
              //   ],
              // ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Miễn phí',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor, fontSize: 17),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Hạn lấy mã: 31/01/2024',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.heart,color: Colors.grey[300],),
                            const SizedBox(width: 10,),
                            Icon(FontAwesomeIcons.circleInfo,color: Colors.grey[300],),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                color: Colors.white,
                child: const ResizableText(
                  textContent: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  ),
                  textStyle: TextStyle(fontSize: 15),
                  firstPartLine: 4,
                ),
              )
            ),

            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: AssetImage('assets/images/user-logo.png'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Text('Hoàng Ngân spa',style: TextStyle(fontSize: 16,color: Colors.black),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Chi tiết ',style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor)),
                            const Icon(Icons.chevron_right),
                          ],
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('1',style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor)),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text('Voucher',style: TextStyle(fontSize: 16,color: Colors.black)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('1',style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor)),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text('Cửa hàng',style: TextStyle(fontSize: 16,color: Colors.black)),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text('Danh sách cửa hàng',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bắc Giang',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Icon(Icons.chevron_right,size: 20,color: Colors.grey,),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.9,
                     child:  ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Theme.of(context).colorScheme.primary,
                       ),
                       child: const Text('Sử dụng',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                       onPressed: (){},
                     ),
                   )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
