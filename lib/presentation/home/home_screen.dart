import 'package:flutter/material.dart';
import 'package:subscription_app/presentation/ressource/color_manager.dart';
import 'package:subscription_app/presentation/ressource/size_manager.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';
import 'package:subscription_app/presentation/ressource/style_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white100,
      appBar: AppBar(
        backgroundColor: ColorManager.white100,
        title: Text(
          StringManager.helloMessage,
          style: getMediumStyle18(
            color: ColorManager.black,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {},
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
                onPressed: () {},
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
}

/*
            children: [
                    children: [
                      Text(
                        '\Unlimited For 1 Month',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Commitments - Cancel Anytime',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Text(
                      'Choose Plan',
                      style: TextStyle(
                          color: c1, fontWeight: FontWeight.w900, fontSize: 18),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '1 Month Auto Renewal Subscription Plan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  yearlySubTile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pro Plan',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '\$ 3599.00',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
              ),
              SizedBox(
                height: 20,
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.done,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\Unlimited For 1 Year',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Commitments - Cancel Anytime',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: c1),
                    onPressed: () {},
                    child: Text(
                      'Choose Plan',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '1 Year Auto Renewal Subscription Plan',
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
