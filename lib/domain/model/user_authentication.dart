import 'package:subscription_app/domain/model/user_data.dart';

import '../../app/constant/constant.dart';

class UserAuthentication {
  final String uid;

  UserAuthentication({required this.uid});

  //----------------------------------------------------------------------------
  // Get user data -------------------------------------------------------------
  //----------------------------------------------------------------------------

  Stream<UserData> get userData {
    return firestore.collection("users")
        .doc(uid)
        .snapshots()
        .map(
          (ds) => UserData(
              username: ds.get("name"),
              stripeId: ds.get("stripeId"),
          ),
    );
  }
}