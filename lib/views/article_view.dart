import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({ Key? key, this.blogUrl }) : super(key: key);
  final  blogUrl;
  //yaha ko override vanda mathi chai data define and constructor matta banaune
  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(
       title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Flutter',style: TextStyle(color: Colors.black),),
           Text('News',style: TextStyle(color: Colors.blue),)
         ],
       ),
       backgroundColor: Colors.white,
       elevation: 0.0,
     ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl ,
          javascriptMode: JavascriptMode.unrestricted,
          // initialUrl: widget.blogUrl ,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
        
      ),
    );
  }
}