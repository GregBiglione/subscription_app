import 'package:flutter/material.dart';
import 'package:subscription_app/presentation/ressource/size_manager.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';

import '../ressource/color_manager.dart';
import '../ressource/style_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: StringManager.email,
                ),
              ),
              const SizedBox(
                height: SizeManager.s10,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: StringManager.password,
                ),
              ),
              const SizedBox(
                height: SizeManager.s20,
              ),
              ElevatedButton(
                onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
