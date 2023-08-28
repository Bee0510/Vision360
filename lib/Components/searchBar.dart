// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable

import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_360/api/service.dart';

class Searchbar extends StatefulWidget {
  Searchbar({Key? key, required this.onSearchPressed})
      : super(
          key: key,
        );
  static TextEditingController searchcontroller =
      TextEditingController(text: 'bitcoin');
  final VoidCallback onSearchPressed;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    var AppColors = Colors.deepPurple;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(35, 35, 35, 100),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    style: GoogleFonts.lato(color: Colors.white),
                    controller: Searchbar.searchcontroller,
                    decoration: InputDecoration(
                        hintText: 'Search a Keyword or a Phrase',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none),
                  ))
                ],
              )),
            ),
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              // fetchNews();
              widget.onSearchPressed();
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(35, 35, 35, 100),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 7),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(35, 35, 35, 100),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
