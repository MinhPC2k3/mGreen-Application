import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view/screen/home/point_used_screen.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.1,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: const Icon(Icons.list),
              ),
              CircleAvatar(
                child: Image.asset('assets/images/mgreen-icon.jpg'),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                width: MediaQuery.of(context).size.width * 0.4,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chưa đặt tên'),
                    Text('30 Điểm'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: const Icon(FontAwesomeIcons.user),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: const Icon(FontAwesomeIcons.bell),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: const Icon(FontAwesomeIcons.cartShopping),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Center(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              // Replace with the actual number of items in your list
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (index == 1) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext contextDialog) =>
                                AlertDialog(
                              // title: const Text('AlertDialog Title'),
                              content: ListView(
                                shrinkWrap: true,
                                children: const [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Vui lòng cập nhật thông tin tài khoản để sử dụng. Tính năng này đang được thí điểm tại TP. Huế',
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(contextDialog, 'OK');
                                      },
                                      child: const Text('Đóng', style: TextStyle(color: Colors.black),),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(contextDialog, 'OK');
                                      },
                                      child: const Text('Cập nhật'),
                                    ),
                                  ],
                            ),
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PointUsed()));
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.mapLocationDot,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: const Center(
                        child: Text(
                          "Ưu đãi quanh đây",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}
