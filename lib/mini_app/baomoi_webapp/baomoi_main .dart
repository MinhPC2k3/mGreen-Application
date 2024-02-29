// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'cubit/webapp_cubit.dart';
import 'webapp_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'cubit_observer.dart';

// void main() {
//   Bloc.observer = const CubitObserver();
//   runApp(
//     MaterialApp(
//       theme: ThemeData(
//           useMaterial3: true,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: const HomeScreen(),
//     ),
//   );
// }
// Bloc.observer = const CubitObserver();
class BaomoiHomeScreen extends StatelessWidget{
  const BaomoiHomeScreen({super.key});
  
  @override
  Widget build (BuildContext context){
    return BlocProvider(
      create: (_)=> WebAppCubit(),
      child: const WebAppView(),
    );
    // return Scaffold(
    //   body: Center(
    //     child: TextButton(
    //       onPressed: () {
    //         Navigator.push(context, MaterialPageRoute(
    //             builder: (context) => BlocProvider(
    //               create: (_)=> WebAppCubit(),
    //               child: WebAppView(),
    //             )));
    //       },
    //       style: ButtonStyle(
    //         backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
    //         shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    //
    //       ),
    //       child: Text("Mở Baomoi",style: TextStyle(color: Colors.white),),
    //
    //     ),
    //   ),
    // );
  }
}

