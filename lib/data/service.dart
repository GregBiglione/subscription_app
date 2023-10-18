import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:subscription_app/app/constant/constant.dart';
import 'package:subscription_app/domain/model/stripe_data.dart';
import 'package:subscription_app/presentation/checkout/checkout_screen.dart';

import '../app/constant/routes.dart';

var logger = Logger();

//------------------------------------------------------------------------------
// Get stripe data -------------------------------------------------------------
//------------------------------------------------------------------------------

Future<StripeData> getStripeData() async {
  DocumentSnapshot documentSnapshot = await firestore.collection("stripe_data")
      .doc("LylkmzBr981sdGl32VMd")
      .get();
  
  return StripeData(
      subStarterPriceId: documentSnapshot.get("subStarterPriceId"),
      subProPriceId: documentSnapshot.get("subProPriceId"),
  );
}

//------------------------------------------------------------------------------
// Buy starter plan ------------------------------------------------------------
//------------------------------------------------------------------------------

buyStarterPlan(String uid, StripeData stripeData, BuildContext context) async {
  DocumentReference documentReference = await firestore.collection("users")
      .doc(uid)
      .collection("checkout_sessions")
      .add({
        "price": stripeData.subStarterPriceId,
        "success_url": successUrl,
        "cancel_url": cancelUrl,
      });

  documentReference.snapshots().listen((docSnapshot) async {
    if(docSnapshot.exists) {
      String url = docSnapshot.get("url");
      print("URL: $url");

      var response = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutScreen(
                url: url,
            ),
          ),
      );
    }
  },);
}