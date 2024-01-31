
import 'package:flutter/material.dart';

class ResizableText extends StatefulWidget{
  const ResizableText({super.key, required this.textContent, this.titleText, required this.firstPartLine, required this.textStyle});
  final Text textContent;
  final Text? titleText;
  // final TextButton? expandButton;
  final int firstPartLine;
  final TextStyle textStyle;

  @override
  State<ResizableText> createState() => _ResizableTextState();
}

class _ResizableTextState extends State<ResizableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context){
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        widget.titleText?? Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: widget.titleText,
        ),
        // Container(
        //   padding: EdgeInsets.all(10),
        //   child: isExpanded ? Column(
        //     children: [
        //       Text(widget.textContent.data!,),
        //     ],
        //   ) : Text(widget.textContent.data!,maxLines: widget.firstPartLine,overflow: TextOverflow.ellipsis,),
        // ),
        AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: isExpanded? Text(widget.textContent.data!,style: widget.textStyle,) : Text(widget.textContent.data!,maxLines: widget.firstPartLine,overflow: TextOverflow.ellipsis,style: widget.textStyle,),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width *1,
          child: TextButton(
            onPressed: (){
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isExpanded ? Text("Thu gọn", style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15),) : Text("Xem thêm", style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15),),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: isExpanded ? const Icon(Icons.arrow_drop_up_outlined,size: 20,) :const Icon(Icons.arrow_drop_down_outlined,size: 20,),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}