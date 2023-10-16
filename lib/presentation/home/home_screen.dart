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