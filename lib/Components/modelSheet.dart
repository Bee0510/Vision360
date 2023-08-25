// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_360/Screen/WebView/webview.dart';
import '../Screen/Home/HomeContainer/divider.dart';

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.up,
      onDismissed: (direction) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => webScreen(
            url: url,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomSheetImage(imageurl: imageurl, title: title),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  description,
                  style: GoogleFonts.lato(fontSize: 14, color: Colors.white),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Swipe up to read Full Article',
                        recognizer: VerticalDragGestureRecognizer()
                          ..onEnd = (details) {
                            if (details.primaryVelocity! > 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => webScreen(url: url)));
                            }
                          },
                        style: GoogleFonts.lato(
                          color: Colors.blue.shade400,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}
