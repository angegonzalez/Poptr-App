import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingNew extends StatelessWidget {
  final String name;
  final String photo;
  final String description;
  final int timeAgo;

  LandingNew({
    Key key,
    @required this.name,
    @required this.photo,
    @required this.description,
    @required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    final containerImg = Container(
      margin: EdgeInsets.only(left: 20),
      height: 50.0,
      width: 50.0,
      child: SvgPicture.network(
        photo,
      ),
    );
    final containerDescription = Flexible(
        child: Container(
      margin: EdgeInsets.only(left: 20.0, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name,
              style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w800)),
          Text(description,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
          Container(
            margin: EdgeInsets.only(top: 7, bottom: 10),
            padding: EdgeInsets.all(5),
            height: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xfff46b45)),
            child: Text(timeAgo.toString() + ' minutes ago',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w900)),
          )
        ],
      ),
    ));

    return Container(
        //height: auto,
        margin: EdgeInsets.only(bottom: 15.0, left: 25.0, right: 25.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.grey,
              width: 0.65,
            )
            /*boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 19.0,
              offset: Offset(.2, .6),
              spreadRadius: 6)
        ],*/
            ),
        child: Flexible(
          child: Row(
            children: <Widget>[containerImg, containerDescription],
          ),
        ));
  }
}
