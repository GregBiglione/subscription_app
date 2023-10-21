import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscription_app/app/constant/constant.dart';
import 'package:subscription_app/presentation/home/home_screen.dart';
import 'package:subscription_app/presentation/ressource/size_manager.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';

import '../../app/constant/routes.dart';
import '../ressource/color_manager.dart';
import '../ressource/style_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        return snapshot.data != null
            ? HomeScreen(uid: snapshot.data!.uid,)
            : Scaffold(
          appBar: AppBar(
            title: Text(
              StringManager.signInTitle,
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
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: StringManager.name,
                    ),
                  ),
                  const SizedBox(
                    height: SizeManager.s10,
                  ),
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
                      register();
                      print("Register clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.purple700,
                    ),
                    child: Text(
                      StringManager.registerButton,
                      style: getMediumStyle18(
                          color: ColorManager.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      StringManager.loginLink,
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
    );
  }

  //----------------------------------------------------------------------------
  // Register user
  //----------------------------------------------------------------------------

  register() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        User user = userCredential.user!;

        // Save user data in firestore -----------------------------------------

        await firestore.collection("users").doc(user.uid).set({
          "name": _nameController.text.trim(),
          "email": _emailController.text.trim(),
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
