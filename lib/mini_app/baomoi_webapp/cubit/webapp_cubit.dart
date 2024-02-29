import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebAppCubit extends Cubit<int> {
  WebAppCubit() : super(0);
  WebViewController webViewController = WebViewController();

  void loadingWebApp(String temp) => {
        if (state == 0)
          {
            // webViewController =WebViewController(),
            webViewController
              ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
                emit(0);
              }, onProgress: (progress) {
                emit(progress);
              }, onPageFinished: (url) {
                emit(100);
              }))
              ..loadRequest(Uri.parse(temp)),
          }
        // else
        //   {
        //     webViewController
        //       ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        //         emit(0);
        //       }, onProgress: (progress) {
        //         emit(progress);
        //       }, onPageFinished: (url) {
        //         emit(100);
        //       }))
        //   }
      };

  void goForward(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    if (await webViewController.canGoForward()) {
      await webViewController.goForward();
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('No forward history item')),
      );
      return;
    }
  }

  void goBack(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
    } else {
      messenger.showSnackBar(
        SnackBar(content: Text("No back history")),
      );
    }
    return;
  }
}
