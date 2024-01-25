import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RowDropDownBtn extends StatelessWidget {
  const RowDropDownBtn({super.key,required this.buttonName});
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration:const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 1,
              color: Colors.grey
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.4,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child:  Text(buttonName,style: const TextStyle(fontSize: 15,color: Colors.black),),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(buttonName,style: const TextStyle(fontSize: 15,color: Colors.black),),
                  const Icon(FontAwesomeIcons.caretDown,size: 17,color: Colors.grey,),
                ],
              ),
            ),
          )

        ],
      ),
    );

  }
}
