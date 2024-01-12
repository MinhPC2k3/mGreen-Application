import 'package:flutter/material.dart';
import 'package:mgreen_app/view/screen/home/main_screen.dart';
import 'package:mgreen_app/view/screen/login/login_screen.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:mgreen_app/view_model/login_slideshow_viewmodal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => LoginSlideShowViewModal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => HomeViewModal(),
        ),
      ],
        child: MaterialApp(
          initialRoute: '/home',
          routes: {
            '/login': (context) => const LoginScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/home': (context) => const MainScreen(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[300]!),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          // home: ChangeNotifierProvider(
          //   create: (context) => LoginSlideShowViewModal(),
          //   child: const LoginScreen(),
          // ),
          // home: const LoginScreen(),
          // home: const HomeScreen(),
        ),
    );
  }
}

