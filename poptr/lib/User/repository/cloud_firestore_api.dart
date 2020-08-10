import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poptr/User/model/user.dart';
import 'package:poptr/User/repository/firebase_auth_api.dart';
import 'package:poptr/User/ui/widgets/landing_new.dart';

class CloudFirestoreAPI {
  final String LANDINGNEWS = 'landing-news';
  final String USERS = 'users';
  final Firestore _db = Firestore.instance;
  final FirebaseAuthAPI _authAPI = FirebaseAuthAPI();

  List<LandingNew> getLandingNews(List landingNewsSnapshot) {
    List<LandingNew> myList = new List<LandingNew>();
    landingNewsSnapshot.forEach((landingNew) {
      myList.add(new LandingNew(
          name: landingNew.data['name'],
          photo: landingNew.data['photo'],
          description: landingNew.data['description'],
          timeAgo: landingNew.data['timeAgo']));
    });
    return myList;
  }
}
