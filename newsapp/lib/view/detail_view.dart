import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class DetailViewScreen extends StatefulWidget {
  String newsUrl;

  DetailViewScreen({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:")
          ? widget.newsUrl.replaceAll("http:", "https:")
          : widget.newsUrl;
    });
  }

  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail View',
          style: TextStyle(
            color: Colors.black, // Set the text color to black
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: widget.newsUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                setState(() {
                  controller.complete(webViewController);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
