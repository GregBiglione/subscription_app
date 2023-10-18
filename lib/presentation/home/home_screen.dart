import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscription_app/domain/model/stripe_data.dart';
import 'package:subscription_app/domain/model/user_authentication.dart';
import 'package:subscription_app/presentation/ressource/color_manager.dart';
import 'package:subscription_app/presentation/ressource/size_manager.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';
import 'package:subscription_app/presentation/ressource/style_manager.dart';

import '../../app/function.dart';
import '../../data/service.dart';
import '../../domain/model/user_data.dart';

class HomeScreen extends StatefulWidget {
  final String uid;

  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StripeData stripeData;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<UserData>(
      stream: UserAuthentication(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data!;

          return FutureBuilder<StripeData>(
            future: getStripeData(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                stripeData = snapshot.data!;

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
                          starterPlan(),
                          const SizedBox(
                            height: SizeManager.s10,
                          ),
                          proPlan(),
                          const SizedBox(
                            height: SizeManager.s40,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return loading(StringManager.loadingStripeData);
              } else {
                return Container(color: Colors.lightBlue,);//const SizedBox();
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
              width: SizeManager.s180,
              height: SizeManager.s40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.white,
                ),
                onPressed: () async {
                  buyStarterPlan(widget.uid, stripeData, context);
                  print("Starter doc added\nuid: ${widget.uid}\nStarter plan id: ${stripeData.subStarterPriceId}");
                },
                child: Text(
                  StringManager.buttonText,
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
                    onPressed: () {},
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
}