import 'package:flutter/material.dart';

class New {
  List comments;
  int likes;
  String newDescription;
  String userDescription;
  String userName;
  String userPhoto;

  New(
      {Key key,
      @required this.comments,
      @required this.likes,
      @required this.newDescription,
      @required this.userDescription,
      @required this.userName,
      @required this.userPhoto});
}
