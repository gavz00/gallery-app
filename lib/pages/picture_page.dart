import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicturePage extends StatefulWidget {

  final String pic;
  PicturePage({Key key, this.pic}) : super(key: key);
  static const String routeName="image";


  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {

  final String imgRoot="assets/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pic}"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imgRoot+widget.pic, fit: BoxFit.fitWidth),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black
        ),
      ),
    );
  }
}