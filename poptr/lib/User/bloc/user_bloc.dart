import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:poptr/User/model/user.dart';
import 'package:poptr/User/repository/cloud_firestore_api.dart';
import 'package:poptr/User/repository/cloud_firestore_repository.dart';
import 'package:poptr/User/repository/firebase_auth_repository.dart';
import 'package:poptr/User/ui/widgets/landing_new.dart';

class UserBloc implements Bloc {
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _auth_repository = AuthRepository();

  List<LandingNew> getLandingNews(List landingNewsSnapshot) =>
      _cloudFirestoreRepository.getLandingNews(landingNewsSnapshot);

  Stream<QuerySnapshot> landingNewsStream() => Firestore.instance
      .collection(CloudFirestoreAPI().LANDINGNEWS)
      .orderBy('timeAgo')
      .snapshots();

  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Sign in & Sign out methods

  Future<FirebaseUser> signIn(String email, String password) {
    return _auth_repository.signIn(email, password);
  }

  void signOut() {
    return _auth_repository.signOut();
  }

  //Get user signed-in info
  Stream<QuerySnapshot> getUserInfo(String user) {
    return Firestore.instance
        .collection(CloudFirestoreAPI().USERS)
        .where('user', isEqualTo: user)
        .snapshots();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
