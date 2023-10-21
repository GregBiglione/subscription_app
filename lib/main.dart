import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subscription_app/presentation/ressource/route_manager.dart';
import 'package:subscription_app/presentation/sign_in/sign_in_screen.dart';

import 'app/constant/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
      onGenerateRoute: RouteManager.getRoute,
      initialRoute: Routes.registerRoute,
    );
  }
}
