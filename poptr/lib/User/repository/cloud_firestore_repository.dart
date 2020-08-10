import 'package:poptr/User/model/user.dart';
import 'package:poptr/User/ui/widgets/landing_new.dart';

import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  List<LandingNew> getLandingNews(List landingNewsSnapshot) =>
      _cloudFirestoreAPI.getLandingNews(landingNewsSnapshot);
  
}
