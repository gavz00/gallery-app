import 'package:apps/pages/login_page.dart';
import 'package:apps/pages/picture_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);
  static const String routeName = "gallery";
  static String imgTap="";

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List imageList = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpg",
    "7.jpg",
    "8.jpg",
    "9.jpg",
    "10.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Gallery"),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset("assets/" + imageList[index],
                      fit: BoxFit.fitWidth);
                },
                itemCount: 5,
                pagination: new SwiperPagination(),
                autoplay: true,
                duration: 500,
                containerHeight: 400.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(imageList.length, (index) {
                return GestureDetector(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Image.asset(
                            "assets/" + imageList[index],
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            imageList[index],
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                  onTap: (){
                    GalleryPage.imgTap= imageList[index];
                    Navigator.pushNamed(context,PicturePage.routeName);
                  },
                );
              }),
            ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: (){
          setState(() {
            Navigator.pop(context, LoginPage.routeName);
          });
        },
      ),
    );
  }
}
