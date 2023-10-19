import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscription_app/domain/model/stripe_data.dart';
import 'package:subscription_app/domain/model/subscription_status.dart';
import 'package:subscription_app/domain/model/user_data.dart';

import '../../app/constant/constant.dart';

class UserAuthentication {
  final String uid;
  final StripeData? stripeData;

  UserAuthentication({required this.uid, this.stripeData});

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

  //----------------------------------------------------------------------------
  // Get subscription active ---------------------------------------------------
  //----------------------------------------------------------------------------

  Stream<SubscriptionStatus> get checkSubscriptionActive {
    return firestore.collection("users")
        .doc(uid)
        .collection("subscriptions")
        .snapshots()
        .map(
          (event) => checkUserHaveActiveSubscription(event),
    );
  }

  SubscriptionStatus checkUserHaveActiveSubscription(QuerySnapshot querySnapshot) {
    for(var documentSnapshot in querySnapshot.docs) {
      String status = documentSnapshot.get("status"); // active or trailing

      if(status == "active" || status == "trailing") {
        DocumentReference priceDocRef = documentSnapshot.get("price");
        String currentPriceId = "";

        if(priceDocRef.id.contains(stripeData!.subStarterPriceId)) {
          currentPriceId = stripeData!.subStarterPriceId;
        }
        else if(priceDocRef.id.contains(stripeData!.subProPriceId)) {
          currentPriceId = stripeData!.subProPriceId;
        }

        return SubscriptionStatus(
          isActiveSubscription: true,
          status: status,
          activePriceId: currentPriceId,
        );
      }
    }
    return SubscriptionStatus(
      isActiveSubscription: false,
      status: "",
      activePriceId: "",
    );
  }
}