import 'package:flutter/material.dart';
// import 'package:mgreen_app/view/component/CustomCornerClipPath.dart';

class PointUsed extends StatelessWidget {
  const PointUsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sử dụng điểm',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        height: MediaQuery.of(context).size.height*0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ClipPath(
                  // clipper: const CustomCornerClipPath(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Đưa mã này cho thu ngân "),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Tự động cập nhật mã sau 15 giây"),
                        const Text("Cập nhật", style: TextStyle(color: Colors.blue),),

                        Stack(
                          children: [

                            SizedBox(
                              height: 25,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 1,
                                      child: Row(
                                        children: List.generate(
                                            700 ~/ 10,
                                                (index) => Expanded(
                                              child: Container(
                                                color:
                                                index % 2 == 0 ? Colors.transparent : Colors.black,
                                                height: 2,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                left: -10,
                                bottom: 0,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey[300],
                                )),
                            Positioned(
                                right: -10,
                                bottom: 0,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey[300],
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                              child: const Text('Số điểm đang có'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: const Text('30 điểm'),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text('NẠP THÊM',style: TextStyle(color: Theme.of(context).primaryColor),),
                                ),

                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),

            )
          ],
        ),
      )
    );
  }
}
