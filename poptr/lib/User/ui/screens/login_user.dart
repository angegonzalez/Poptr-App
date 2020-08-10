import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:poptr/User/bloc/user_bloc.dart';
import 'package:poptr/User/ui/screens/landing_user.dart';
import 'package:poptr/User/ui/widgets/landing_new.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserBloc userBloc;

  String myEmail = '';

  String myPassword = '';

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    userBloc.signOut();
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //Snapshot contains data => User object from firebase
        if (!snapshot.hasData || snapshot.hasError) {
          return loginUI();
         //return LandingUser();
        } else {
          // return loginUI();
          return LandingUser(myEmail);
        }
      },
    );
  }

  Widget loginUI() {
    userBloc = BlocProvider.of<UserBloc>(context);
    final mySnackbar = SnackBar(
      content: Text('¡Hay un campo vacio! Corrígelo 😉'),
    );

    final loginCard = Container(
      // margin: EdgeInsets.only(left: 50.0),
      child: Stack(
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(left: 70.0),
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.5),
              gradient: LinearGradient(
                  colors: [Color(0xfff46b45), Color(0xffEEA849)],
                  begin: FractionalOffset(0.1, 0.5),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.1, 0.6],
                  tileMode: TileMode.clamp),
            ),
          ),
          FlipCard(
            key: cardKey,
            flipOnTouch: false,
            back: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Text(
                      "Hola",
                      style: TextStyle(
                          color: Color(0xfff46b45),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                /*boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 18.0,
                        offset: Offset(.1, .6),
                        spreadRadius: 5)
                  ]*/
              ),
              width: double.infinity,
              height: 280.0,
            ),
            front: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Text(
                      "Iniciar sesión",
                      style: TextStyle(
                          color: Color(0xfff46b45),
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            padding: EdgeInsets.only(left: 15, top: 3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 8.0,
                                      offset: Offset(.1, .6),
                                      spreadRadius: 5)
                                ]),
                            child: TextField(
                              autofocus: true,
                              onChanged: (text) {
                                myEmail = text;
                                //print(myEmail);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Introduce aqui tu email',
                                  suffixIcon:
                                      Icon(Icons.email, color: Colors.grey)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            height: 50.0,
                            padding: EdgeInsets.only(left: 15, top: 3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 8.0,
                                      offset: Offset(.1, .6),
                                      spreadRadius: 5)
                                ]),
                            child: TextField(
                              autofocus: true,
                              obscureText: true,
                              onChanged: (text) {
                                myPassword = text;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Introduce aqui tu contraseña',
                                  suffixIcon:
                                      Icon(Icons.vpn_key, color: Colors.grey)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 140.0,
                                height: 40.0,
                                margin: EdgeInsets.only(top: 17.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xfff46b45),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      if (myEmail == '' || myPassword == '') {
                                        Scaffold.of(context)
                                            .showSnackBar(mySnackbar);
                                      } else {
                                        userBloc
                                            .signIn(myEmail, myPassword)
                                            .then((value) => this.myEmail= value.email)
                                            .catchError((e) {
                                          final myErrorSnackbar =
                                              SnackBar(content: Text(e));
                                          Scaffold.of(context)
                                              .showSnackBar(myErrorSnackbar);
                                        });
                                        
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 8, left: 10),
                                      child: Text(
                                        'Inicia sesión',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    )),
                              ),
                              Container(
                                  width: 130.0,
                                  height: 40.0,
                                  margin: EdgeInsets.only(
                                    top: 17.0,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: .5, color: Colors.grey)),
                                  child: InkWell(
                                    onTap: () {
                                      cardKey.currentState.toggleCard();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 8, left: 10),
                                      child: Text(
                                        'Regístrate',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ))
                ],
              ),
              margin: EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                /*boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 18.0,
                        offset: Offset(.1, .6),
                        spreadRadius: 5)
                  ]*/
              ),
              width: double.infinity,
              height: 280.0,
            ),
          )
        ],
      ),
    );

    Widget myLogin(AsyncSnapshot snapshot) {
      return Container(
        child: Column(
          children: <Widget>[
            loginCard,
            Flexible(
              child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  //height: 400,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: userBloc.getLandingNews(snapshot.data.documents),
                  )),
            )
          ],
        ),
      );
    }

    return StreamBuilder(
      stream: userBloc.landingNewsStream(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return CircularProgressIndicator();
            break;
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.active:
            return myLogin(snapshot);
            break;
          case ConnectionState.done:
            return myLogin(snapshot);
            break;
        }
      },
    );
  }
}
