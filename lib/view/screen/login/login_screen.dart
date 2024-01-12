import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view_model/login_slideshow_viewmodal.dart';
import 'package:provider/provider.dart';

import 'login_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginSlideShowViewModal>(
        builder: (context, loginSlideshowViewModal, child) {
      return Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.inversePrimary,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/images/logomgreen.png"),
                      ),
                      Flexible(
                        child: Text(
                          "ỨNG DỤNG PHÂN LOẠI RÁC TẠI NGUỒN ĐƯỢC TÍCH ĐIỂM TẶNG QUÀ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary),
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: PageView(
                        controller: controller,
    // scrollDirection: Axis.horizontal,
                        onPageChanged: (temp) {
                          // print("This is page index $temp");
                          loginSlideshowViewModal.changePage(temp);
                      },
                      children: <Widget>[
                        SizedBox(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: 300,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Image.asset(
                                    "assets/images/login-slideshow1.jpg"),
                              ),
                              Text(
                                "Phân loại rác tại nguồn bảo vệ môi trường0",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).colorScheme.primary),
                                maxLines: 2,
                              ),
                              Text(
                                "Được tích điểm nhận quà",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).colorScheme.primary),
                                maxLines: 2,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: ElevatedButton(
                                  onPressed: (){
                                    controller.nextPage(duration:const Duration(milliseconds: 600), curve: Curves.linear);
                                    loginSlideshowViewModal.changePage(loginSlideshowViewModal.currentPageView+1);
                                  },
                                  child:const Text("Tiếp"),
                                ),
                              )
                            ],
                          ),

                        ),
                        SizedBox(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: 300,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Image.asset(
                                    "assets/images/login-slideshow1.jpg"),
                              ),
                              Text(
                                "Phân loại rác tại nguồn bảo vệ môi trường1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).colorScheme.primary),
                                maxLines: 2,
                              ),
                              Text(
                                "Được tích điểm nhận quà",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).colorScheme.primary),
                                maxLines: 2,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: ElevatedButton(
                                  onPressed: (){
                                    controller.nextPage(duration:const Duration(milliseconds: 600), curve: Curves.linear);
                                    loginSlideshowViewModal.changePage(loginSlideshowViewModal.currentPageView+1);
                                  },
                                  child:const Text("Tiếp"),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: 300,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Image.asset(
                                    "assets/images/login-slideshow1.jpg"),
                              ),
                              Text(
                                "Phân loại rác tại nguồn bảo vệ môi trường2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).colorScheme.primary),
                                maxLines: 2,
                              ),
                              Text(
                                "Được tích điểm nhận quà",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).colorScheme.primary),
                                maxLines: 2,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: ElevatedButton(
                                  onPressed: (){
                                    showModalBottomSheet<void>(
                                      context: context,
                                      isScrollControlled: true,
                                      enableDrag: false,
                                      builder: (BuildContext context)=>

                                         SizedBox(
                                           height: MediaQuery.of(context).size.height*0.9,
                                             child: Scaffold(
                                               appBar: AppBar(
                                                 leading: IconButton(
                                                   onPressed: ()=>{
                                                     Navigator.pop(context),
                                                   }, icon: const Icon(FontAwesomeIcons.arrowLeft,color: Colors.white,),
                                                 ),
                                                 actions: [
                                                   InkWell(
                                                     onTap: ()=>{
                                                       Navigator.pop(context),
                                                     },
                                                     child: Container(
                                                       padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                       child: const Text("Hủy",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                     ),
                                                   )
                                                 ],
                                                 backgroundColor: Theme.of(context).primaryColor,
                                                 title: const Center(child: Text("Đăng nhập",style: TextStyle(color: Colors.white),),),
                                               ),
                                               body: SizedBox(
                                                 height: MediaQuery.of(context).size.height *0.8,
                                                 child:  LoginDialog(loginSlideShowViewModal: loginSlideshowViewModal,),
                                               ),
                                             ),
                                         )
                                    );
                                  },
                                  child:const Text("Đăng nhập bằng số điện thoại"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )

                  ),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        3,
                            (index) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: CircleAvatar(
                              maxRadius: 7,
                              minRadius: 5,
                              // radius: 3,
                              backgroundColor:
                              loginSlideshowViewModal.currentPageView == index ? Colors.green[500] : Colors.green[200],
                            ),
                          );
                        },
                      ),
                    ),
                  )

// Container(
//   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//   height: 300,
//   width: MediaQuery.of(context).size.width * 1,
//   child: Image.asset("assets/images/login-slideshow1.jpg"),
// ),
// Flexible(child: Text("Phân loại rác tại nguồn bảo vệ môi trường",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Theme.of(context).colorScheme.primary),maxLines: 2,),),
// Flexible(child: Text("Được tích điểm nhận quà",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Theme.of(context).colorScheme.primary),maxLines: 2,),),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

// _buildDraggable(),
}
