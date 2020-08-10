import 'package:flutter/material.dart';

class User {
  final String user;
  final String userDescription;
  final String userName;
  final String userPhoto;

  User(
      {Key key,
      @required this.user,
      @required this.userDescription,
      @required this.userName,
      @required this.userPhoto});
}
