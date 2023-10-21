import 'package:flutter/material.dart';
import 'package:subscription_app/presentation/ressource/size_manager.dart';

import '../../app/constant/constant.dart';
import '../../app/constant/routes.dart';
import '../ressource/color_manager.dart';
import '../ressource/string_manager.dart';
import '../ressource/style_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoadingVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.logInTitle,
          style: getMediumStyle18(
            color: ColorManager.black,
          ),
        ),
        backgroundColor: ColorManager.white100,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: ColorManager.white100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
              SizeManager.s18
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: StringManager.email,
                ),
              ),
              const SizedBox(
                height: SizeManager.s10,
              ),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: StringManager.password,
                ),
              ),
              const SizedBox(
                height: SizeManager.s20,
              ),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.purple700,
                ),
                child: Text(
                  StringManager.loginButton,
                  style: getMediumStyle18(
                    color: ColorManager.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.registerRoute);
                },
                child: Text(
                  StringManager.registerLink,
                  style: getMediumStyle14(
                    color: ColorManager.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Login user
  //----------------------------------------------------------------------------

  login() async {
    setState(() {
      isLoadingVisible = true;
    });

    await auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    setState(() {
      isLoadingVisible = false;
    });
    String uid = auth.currentUser!.uid;

    gotoHomeScreen(uid);
  }

  //----------------------------------------------------------------------------
  // Go to home
  //----------------------------------------------------------------------------

  void gotoHomeScreen(String uid) {
    Navigator.pushNamed(
        context,
        Routes.homeRoute,
        arguments: uid,
    );
  }
}
