// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webScreen extends StatefulWidget {
  const webScreen({super.key, required this.url});
  final String url;

  @override
  State<webScreen> createState() => _webScreenState();
}

class _webScreenState extends State<webScreen> {
  int loadingPercent = 0;
  late final WebViewController _controller;
  @override
  void initState() {
    _controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercent = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercent = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercent = 100;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loadingPercent < 100)
            LinearProgressIndicator(
              value: loadingPercent / 100,
            )
        ],
      ),
    );
  }
}
