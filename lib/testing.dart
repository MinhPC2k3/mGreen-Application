import 'package:flutter/material.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  _StackExampleState createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: const AssetImage('assets/images/gift_img.jpeg'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.3,
              fit: BoxFit.cover,
            ),
            // ClipRRect(borderRadius: BorderRadius.circular(25), child: Image.asset('assets/images/gift_img.jpeg')),
            Positioned(
              bottom: -50,
              right: 20,
              left: 20,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TITLE",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hey, There?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, decoration: TextDecoration.none, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "This is the example",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, decoration: TextDecoration.none, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}