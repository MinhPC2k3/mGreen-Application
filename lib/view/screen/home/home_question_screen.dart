import 'package:flutter/material.dart';

class HomeQuestion extends StatefulWidget{
  const HomeQuestion({super.key});

  @override
  State<HomeQuestion> createState() => _HomeQuestionState();
}

class _HomeQuestionState extends State<HomeQuestion>{
  static final List<String> _answerOptions = ['10 năm','100 năm',"Có thể gần 1000 năm"];
  String _choosenOption ='';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Học và chơi", style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_question.jpg'),
              fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Câu hỏi 1:',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            const Text('Vi nhựa - các phân tử nhựa sẽ mất bao lâu để phân hủy ở ngoài môi trường ?', maxLines: 2,),
            for(String temp in _answerOptions) RadioListTile(value: temp, groupValue: _choosenOption, onChanged: (String? value){
              setState(() {
                _choosenOption = value!;
              });
            }, title: Text(temp),),
            Center(
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),

                  )
                ),
                child: const Text("Trả lời", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        )
      ),
    );
  }
}