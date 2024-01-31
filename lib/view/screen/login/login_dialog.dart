import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgreen_app/view_model/login_slideshow_viewmodal.dart';

class LoginDialog extends StatefulWidget{

  final LoginSlideShowViewModal loginSlideShowViewModal;
  const LoginDialog({super.key, required this.loginSlideShowViewModal});
  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Image.asset("assets/images/logomgreen.png"),
            ),
          ),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 20, 0, 20),
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Center(
              child: Text(
                'Vui lòng đăng nhập số điện thoại để sử dụng các dịch vụ của mGreen',maxLines: 2,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15,),textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Container(
                  padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Icon(FontAwesomeIcons.phone,color: Theme.of(context).colorScheme.inversePrimary,),
                ),
                const Text(
                  'Số điện thoại',maxLines: 2,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15,),textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width *0.8,
            child: TextFormField(
              controller: widget.loginSlideShowViewModal.inputController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'VD: 0912345678',
              ),
              maxLines: 1,
            ),
          ),
          // const Text('Vui lòng đăng nhập số điện thoại để sử dụng các dịch vụ của mGreen',maxLines: 2,style: TextStyle(color: Colors.black,fontSize: 15),),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,

              ),
              child: const Text('Đăng nhập',style: TextStyle(color: Colors.white,fontSize: 16),),
              onPressed: (){
                widget.loginSlideShowViewModal.checkInput(widget.loginSlideShowViewModal.inputController.text);
                if(widget.loginSlideShowViewModal.checkValidInput){
                  Navigator.of(context).pop(true);
                  Navigator.pushReplacementNamed(context, '/home');
                }else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          )
        ],
    );
  }
}