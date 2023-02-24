// import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Imagelist extends StatefulWidget {
  const Imagelist({Key? key}) : super(key: key);

  @override
  State<Imagelist> createState() => _ImagelistState();
}

class _ImagelistState extends State<Imagelist> {

  List<String> imageUrl = [
    "https://images.unsplash.com/photo-1518190861674-a54705365aad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1445810694374-0a94739e4a03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=946&q=80",
    "https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "https://images.unsplash.com/photo-1530650450572-bd8713d69d2f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1468818438311-4bab781ab9b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageUrl.map((item) =>
            Container(
              margin: EdgeInsets.all(10),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
              child: Image.network(item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
            ),).toList(),

        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: false,

        ),
      ),
    );
  }
}
