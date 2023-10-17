import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscription_app/app/constant.dart';
import 'package:subscription_app/domain/model/stripe_data.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';

//------------------------------------------------------------------------------
// Get stripe data -------------------------------------------------------------
//------------------------------------------------------------------------------

Future<StripeData> getStripeData() async {
  DocumentSnapshot documentSnapshot = await firestore
      .collection("stripe_data")
      .doc("LylkmzBr981sdGl32VMd")
      .get();
  
  return StripeData(
      subStarterPriceId: documentSnapshot.get("subStarterPriceId"),
      subProPriceId: documentSnapshot.get("subProPriceId"),
  );
}