import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poptr/News/model/new.dart';
import 'package:poptr/News/ui/widgets/user_image.dart';
import 'package:poptr/User/model/user.dart';

class NewCard extends StatelessWidget {
  New myNew;
  User userLoggedIn;

  NewCard(this.myNew, this.userLoggedIn);

  @override
  Widget build(BuildContext context) {
    final userHeader = Container(
      height: 50.0,
      width: double.infinity,
      //margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserImage(myNew.userPhoto),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                myNew.userName,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  myNew.userDescription,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              )
            ],
          )
        ],
      ),
    );

    final newDescription = Container(
        //margin: EdgeInsets.only(),
        //width: 200.0,
        height: 20.0,
        child: Flexible(
          child: Text(
            myNew.newDescription,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15),
          ),
        ));

    final userResponse = Container(
        margin: EdgeInsets.only(top: 10.0),
        height: 50.0,
        child: Row(
          children: <Widget>[
            UserImage(userLoggedIn.userPhoto),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userLoggedIn.userName,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Container(
                    child: TextField(
                  enabled: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escribe un comentario',
                  ),
                ))
              ],
            )
          ],
        ));

    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.all(15),
        width: double.infinity,
        // height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.grey, width: .7)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[userHeader, newDescription, userResponse]));
  }
}
