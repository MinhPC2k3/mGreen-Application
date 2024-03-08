import 'package:flutter/material.dart';
import 'package:mgreen_app/testing.dart';
import 'package:mgreen_app/view/screen/login/login_screen.dart';
import 'package:mgreen_app/view_model/account_viewModal.dart';
import 'package:mgreen_app/view_model/home_viewModal.dart';
import 'package:mgreen_app/view_model/login_slideshow_viewmodal.dart';
import 'package:mgreen_app/view_model/voucher_viewModal.dart';
import 'package:provider/provider.dart';
import 'test_mini_app/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // static const platform = MethodChannel('com.example.mgreen_app');
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
        ChangeNotifierProvider(
          create: (ctx) => VoucherViewModal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AccountViewModal(),
        ),
      ],
        child: MaterialApp(
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            // '/home': (context) => const MainScreen(),
            '/testing': (context) => const StackExample(),
            '/miniApp': (context) => const MiniAppScreen(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[300]!),
            primaryColor: Colors.green[400],
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

