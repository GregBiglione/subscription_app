import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscription_app/domain/model/stripe_data.dart';
import 'package:subscription_app/domain/model/subscription_status.dart';
import 'package:subscription_app/domain/model/user_authentication.dart';
import 'package:subscription_app/presentation/customer_portal/customer_portal_screen.dart';
import 'package:subscription_app/presentation/ressource/color_manager.dart';
import 'package:subscription_app/presentation/ressource/size_manager.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';
import 'package:subscription_app/presentation/ressource/style_manager.dart';

import '../../app/constant/constant.dart';
import '../../app/function.dart';
import '../../data/service.dart';
import '../../domain/model/user_data.dart';
import '../checkout/checkout_screen.dart';

class HomeScreen extends StatefulWidget {
  final String uid;

  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StripeData stripeData;
  late SubscriptionStatus subscriptionStatus;
  bool isLoadingPayment = false;
  String? error = "";

  @override
  Widget build(BuildContext context) {

    return isLoadingPayment
        ? loading(processPayment)
        : StreamBuilder<UserData>(
      stream: UserAuthentication(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data!;

          return FutureBuilder<StripeData>(
            future: getStripeData(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                stripeData = snapshot.data!;

                return StreamBuilder<SubscriptionStatus>(
                  stream: UserAuthentication(
                    uid: widget.uid,
                    stripeData: stripeData,
                  ).checkSubscriptionActive,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      subscriptionStatus = snapshot.data!;

                      return Scaffold(
                        backgroundColor: ColorManager.white100,
                        appBar: AppBar(
                          backgroundColor: ColorManager.white100,
                          title: Text(
                            StringManager.helloMessage + userData.username,
                            style: getMediumStyle18(
                              color: ColorManager.black,
                            ),
                          ),
                          elevation: 0,
                          actions: [
                            IconButton(
                              onPressed: () {
                                logout();
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                        body: Container(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: SizeManager.s30,
                                ),
                                subscriptionStatus.isActiveSubscription
                                    && subscriptionStatus.activePriceId
                                    == stripeData.subStarterPriceId
                                || subscriptionStatus.isActiveSubscription == false
                                    ? starterPlan()
                                    : const SizedBox(),
                                const SizedBox(
                                  height: SizeManager.s10,
                                ),
                                subscriptionStatus.isActiveSubscription
                                    && subscriptionStatus.activePriceId
                                    == stripeData.subProPriceId
                                || subscriptionStatus.isActiveSubscription == false
                                    ? proPlan()
                                    : const SizedBox(),
                                const SizedBox(
                                  height: SizeManager.s40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return loading(StringManager.loadingSubscriptionStatus);
                    } else {
                      return const SizedBox();
                    }
                  }
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return loading(StringManager.loadingStripeData);
              } else {
                return const SizedBox();
              }
            }
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return loading(StringManager.loadingUserData);
        } else {
          return const SizedBox();
        }
      }
    );
  }

  //----------------------------------------------------------------------------
  // Starter plan
  //----------------------------------------------------------------------------

  starterPlan() => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: SizeManager.s20,
    ),
    child: Card(
      elevation: SizeManager.s4,
      color: ColorManager.purple700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeManager.s10,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SizeManager.s30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringManager.starterTitle,
              style: getRegularStyle20(
                color: ColorManager.white,
              ),
            ),
            const SizedBox(
              height: SizeManager.s20,
            ),
            Text(
              StringManager.starterPrice,
              style: getBoldStyle26(
                color: ColorManager.white,
              ),
            ),
            const SizedBox(
              height: SizeManager.s20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      color: ColorManager.white,
                    ),
                    const SizedBox(
                      height: SizeManager.s10,
                    ),
                    Icon(
                      Icons.done,
                      color: ColorManager.white,
                    ),
                  ],
                ),
                const SizedBox(
                  width: SizeManager.s20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.starterFirstCondition,
                      style: getRegularStyle14(
                        color: ColorManager.white,
                      ),
                    ),
                    const SizedBox(
                      height: SizeManager.s20,
                    ),
                    Text(
                      StringManager.secondCondition,
                      style: getRegularStyle14(
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: SizeManager.s20,
            ),
            SizedBox(
              //width: SizeManager.s180,
              height: SizeManager.s40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.white,
                ),
                onPressed: () async {
                  subscriptionStatus.isActiveSubscription == false
                      ? buyStarterPlan()
                      : customerPortal();
                },
                child: Text(
                  subscriptionStatus.isActiveSubscription == false
                      ? StringManager.buttonText
                      : StringManager.buttonTextSubscriptionActivated,
                  style: getBoldStyle18(
                    color: ColorManager.purple700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: SizeManager.s40,
            ),
            Text(
              StringManager.starterRenewal,
              style: getRegularStyle14(
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  //----------------------------------------------------------------------------
  // Pro plan
  //----------------------------------------------------------------------------

  proPlan() => Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeManager.s20,
      ),
      child: Card(
        elevation: SizeManager.s4,
        color: ColorManager.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                SizeManager.s10,
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: SizeManager.s30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringManager.proTitle,
                style: getRegularStyle20(
                    color: ColorManager.black,
                ),
              ),
              const SizedBox(
                height: SizeManager.s20,
              ),
              Text(
                StringManager.proPrice,
                style: getBoldStyle26(
                    color: ColorManager.black,
                ),
              ),
              const SizedBox(
                height: SizeManager.s20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.done,
                      ),
                      SizedBox(
                        height: SizeManager.s10,
                      ),
                      Icon(
                        Icons.done,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: SizeManager.s20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringManager.proFirstCondition,
                        style: getRegularStyle14(
                          color: ColorManager.black,
                        ),
                      ),
                      const SizedBox(
                        height: SizeManager.s20,
                      ),
                      Text(
                        StringManager.secondCondition,
                        style: getRegularStyle14(
                          color: ColorManager.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: SizeManager.s20,
              ),
              SizedBox(
                width: SizeManager.s180,
                height: SizeManager.s40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.purple700,
                    ),
                    onPressed: () async {
                      buyProPlan();
                    },
                    child: Text(
                      StringManager.buttonText,
                      style: getBoldStyle18(
                          color: ColorManager.white,
                      ),
                    ),
                ),
              ),
              const SizedBox(
                height: SizeManager.s40,
              ),
              Text(
                StringManager.proRenewal,
                style: getRegularStyle14(
                  color: ColorManager.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  //----------------------------------------------------------------------------
  // Logout
  //----------------------------------------------------------------------------

  logout() async {
    await FirebaseAuth.instance.signOut();
  }

  //----------------------------------------------------------------------------
  // Buy pro plan --------------------------------------------------------------
  //----------------------------------------------------------------------------

  buyStarterPlan() async {
    setState(() {
      isLoadingPayment = true;
    });

    DocumentReference documentReference = await firestore.collection("users")
        .doc(widget.uid)
        .collection("checkout_sessions")
        .add({
      "price": stripeData.subStarterPriceId,
      "success_url": successUrl,
      "cancel_url": cancelUrl,
    });

    documentReference.snapshots().listen((docSnapshot) async {
      if(docSnapshot.exists) {
        try {
          error = docSnapshot.get("error");
        } catch (e) {
          error = null;
        }

        if(error != null) {
          logger.e(error);
        }
        else {
          String url = docSnapshot.get("url");

          var response = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                url: url,
              ),
            ),
          );

          if(response == success) {
            // Payment successful ------------------------------------------------
            setState(() {
              isLoadingPayment = false;
            });
          }
          else {
            // Payment failed ----------------------------------------------------
            setState(() {
              isLoadingPayment = false;
            });
          }
        }
      }
    },);
  }

  //----------------------------------------------------------------------------
  // Buy starter plan ----------------------------------------------------------
  //----------------------------------------------------------------------------

  buyProPlan() async {
    setState(() {
      isLoadingPayment = true;
    });

    DocumentReference documentReference = await firestore.collection("users")
        .doc(widget.uid)
        .collection("checkout_sessions")
        .add({
      "price": stripeData.subProPriceId,
      "success_url": successUrl,
      "cancel_url": cancelUrl,
    });

    documentReference.snapshots().listen((docSnapshot) async {
      if(docSnapshot.exists) {
        try {
          error = docSnapshot.get("error");
        } catch (e) {
          error = null;
        }

        if(error != null) {
          logger.e(error);
        }
        else {
          String url = docSnapshot.get("url");

          var response = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                url: url,
              ),
            ),
          );

          if(response == success) {
            // Payment successful ------------------------------------------------
            setState(() {
              isLoadingPayment = false;
            });
          }
          else {
            // Payment failed ----------------------------------------------------
            setState(() {
              isLoadingPayment = false;
            });
          }
        }
      }
    },);
  }

  //----------------------------------------------------------------------------
  // Manage subscription -------------------------------------------------------
  //----------------------------------------------------------------------------

  Future<void> customerPortal() async {
    try {
      HttpsCallable callable = FirebaseFunctions.instance
          .httpsCallableFromUrl(stripePortalUrl);

      HttpsCallableResult result = await callable.call({
        "returnUrl": cancelUrl
      });
      logger.i(result.data);

      if (result.data != null) {
        String url = result.data["url"];

        goToCustomerPortal(url);
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }

  //----------------------------------------------------------------------------
  // Go to customer portal
  //----------------------------------------------------------------------------

  void goToCustomerPortal(String url) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CustomerPortalScreen(url: url),),
    );
  }
}