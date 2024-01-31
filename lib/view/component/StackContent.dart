import 'package:flutter/material.dart';

class IndextedStackContent extends StatefulWidget{
  const IndextedStackContent({super.key,required this.screenContent,required this.screenIndex});
  final List<Widget> screenContent;
  final int screenIndex;

  @override
  State<IndextedStackContent> createState() => _IndextedStackContentState();
}
int screenIndex =0 ;
class _IndextedStackContentState extends State<IndextedStackContent>  with TickerProviderStateMixin{
  
  
  @override
  Widget build (BuildContext context){
    return IndexedStack(
      index: widget.screenIndex,
      children:widget.screenContent,
      
    );
  }
}