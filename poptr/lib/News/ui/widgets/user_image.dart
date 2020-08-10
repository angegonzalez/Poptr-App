import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserImage extends StatelessWidget{

  String imageURL; 

  UserImage(this.imageURL);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.only(right: 10, top: 5),
        child: SvgPicture.network(
          imageURL,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ));
  }
  
}