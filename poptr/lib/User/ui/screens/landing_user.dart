import 'package:flutter/material.dart';
import 'package:flutter_status_bar_light/flutter_status_bar_light.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:poptr/News/model/new.dart';
import 'package:poptr/News/ui/widgets/new_card.dart';
import 'package:poptr/User/bloc/user_bloc.dart';
import 'package:poptr/User/model/user.dart';
import 'package:poptr/User/ui/screens/login_user.dart';

class LandingUser extends StatelessWidget {
  String userLoggedIn;
  UserBloc userBloc;

  LandingUser(this.userLoggedIn);

  @override
  Widget build(BuildContext context) {
    FlutterStatusBarLight.setLightStatusBar();
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: userBloc.getUserInfo(userLoggedIn),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CircularProgressIndicator();
              break;
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
              return landingUI(snapshot);
              break;
            case ConnectionState.done:
              return landingUI(snapshot);
              break;
          }
        });
  }

  Widget landingUI(AsyncSnapshot snapshot) {
    var myInfo = snapshot.data.documents[0];
    New myNew = new New(
        comments: [],
        likes: 0,
        newDescription: 'Hola sahdgsjahdsahdskjada',
        userDescription: 'sdjkbasdhsadsakjd',
        userName: 'Angel Gonzalez',
        userPhoto: 'https://image.flaticon.com/icons/svg/1226/1226097.svg');
    User myUser = new User(
        user: myInfo['user'],
        userDescription: myInfo['userDescription'],
        userName: myInfo['userName'],
        userPhoto: myInfo['userPhoto']);

    return Scaffold(
        body: Column(
      children: <Widget>[barMenu(snapshot), NewCard(myNew, myUser)],
    ));
  }

  Widget barMenu(AsyncSnapshot snapshot) {
    final double mySize = 35;
    final double myPadding = 5.5;
    var myInfo = snapshot.data.documents[0];

    final Widget homeSvg = Container(
        width: mySize,
        height: mySize,
        padding: EdgeInsets.all(myPadding),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(.1, .6),
                  spreadRadius: 3)
            ]),
        child: SvgPicture.network(
          'https://image.flaticon.com/icons/svg/2948/2948025.svg',
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ));
    final Widget profileSvg = Container(
        width: mySize,
        height: mySize,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(myPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(.1, .6),
                  spreadRadius: 3)
            ]),
        child: SvgPicture.network(
          'https://image.flaticon.com/icons/svg/2948/2948035.svg',
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ));
    final Widget transactionsSvg = Container(
        width: mySize,
        height: mySize,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(myPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(.1, .6),
                  spreadRadius: 3)
            ]),
        child: SvgPicture.network(
          'https://image.flaticon.com/icons/svg/2948/2948088.svg',
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ));

    final Widget profilePhotoSvg = Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.all(8),
        child: SvgPicture.network(
          myInfo['userPhoto'],
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ));

    final profilePhoto = InkWell(
        onTap: () {
          userBloc.signOut();
        },
        child: Container(
            margin:
                EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10),
            width: 50.0,
            height: 50.0,
            child: profilePhotoSvg));

    final newPubPlaceHolder = Container(
        // margin: EdgeInsets.only(left: 10),
        height: 40.0,
        width: 240.0,
        padding: EdgeInsets.only(left: 15, top: 3),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            /*boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(.1, .6),
                  spreadRadius: 3)
            ]*/
            border: Border.all(color: Colors.grey, width: .85)),
        child: TextField(
          enabled: false,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Pregunta sobre algún trámite',
          ),
        ));

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              'Poptr',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 35.2,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
              left: 25.0,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[homeSvg, profileSvg, transactionsSvg],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 80.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(.1, .6),
                      spreadRadius: 6)
                ]),
            child: Row(
              children: <Widget>[profilePhoto, newPubPlaceHolder],
            ),
          )
        ],
      ),
    );
  }
}
