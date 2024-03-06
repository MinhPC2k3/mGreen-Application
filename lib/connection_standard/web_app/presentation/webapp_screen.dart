import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/webapp_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebAppView extends StatefulWidget{
  const WebAppView({super.key, required this.webAppUrl});
  final String webAppUrl;
  @override
  State<WebAppView> createState() => _WebAppViewState();
}

class _WebAppViewState extends State<WebAppView> {
  @override
  Widget build(BuildContext context){
    return BlocBuilder<WebAppCubit,int>(
        builder: (context , state){
          context.read<WebAppCubit>().loadingWebApp(widget.webAppUrl);
          return Scaffold(
              appBar: AppBar(
                title: const Text("Baomoi", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                backgroundColor: Colors.blueAccent,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.exit_to_app,color: Colors.white,size: 20,)),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () async {
                      context.read<WebAppCubit>().goBack(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () async {
                      context.read<WebAppCubit>().goForward(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay),
                    onPressed: () {
                      context.read<WebAppCubit>().webViewController.reload();
                    },
                  ),
                ],
              ),

              body: Stack(
                children: [
                  WebViewWidget(
                    controller: context.read<WebAppCubit>().webViewController,
                  ),
                  if(state <100) LinearProgressIndicator(
                    color: Colors.blueAccent,
                    backgroundColor: Colors.white,

                    value: state/100,
                  ),
                ],
              )
          );
        }
    );
  }
  // late final WebViewController webViewController;
  // var loadingPercentage =0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   webViewController = WebViewController();
  //   webViewController..setNavigationDelegate(NavigationDelegate(
  //     onPageStarted: (url) {
  //       setState(() {
  //         loadingPercentage =0;
  //       });
  //     },
  //     onProgress: (progress) {
  //       setState(() {
  //         loadingPercentage =progress;
  //       });
  //     },
  //     onPageFinished: (url){
  //       setState(() {
  //         loadingPercentage = 100;
  //       });
  //     }
  //   ))..loadRequest(Uri.parse("https://baomoi.com/"));
  // }
  // @override
  // Widget build (BuildContext context){
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Baomoi", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
  //       backgroundColor: Colors.blueAccent,
  //       automaticallyImplyLeading: false,
  //       actions: [
  //         IconButton(onPressed: (){
  //           Navigator.pop(context);
  //         }, icon: const Icon(Icons.exit_to_app,color: Colors.white,size: 20,))
  //       ],
  //     ),
  //
  //     body: Stack(
  //       children: [
  //         WebViewWidget(
  //           controller: webViewController,
  //         ),
  //         if(loadingPercentage <100) LinearProgressIndicator(
  //           color: Colors.blueAccent,
  //           backgroundColor: Colors.white,
  //
  //           value: loadingPercentage/100,
  //         ),
  //       ],
  //     )
  //   );
  // }
}