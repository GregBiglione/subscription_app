import 'package:flutter/material.dart';
import 'package:subscription_app/presentation/checkout/checkout_screen.dart';
import 'package:subscription_app/presentation/customer_portal/customer_portal_screen.dart';
import 'package:subscription_app/presentation/ressource/string_manager.dart';
import 'package:subscription_app/presentation/sign_in/sign_in_screen.dart';

import '../../app/constant/routes.dart';
import '../home/home_screen.dart';

class RouteManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.checkoutRoute:
        String args = routeSettings.arguments as String;
        String url = args;
        return MaterialPageRoute(builder: (_) => CheckoutScreen(url: url));
      case Routes.customerPortalRoute:
        String args = routeSettings.arguments as String;
        String url = args;
        return MaterialPageRoute(builder: (_) => CustomerPortalScreen(url: url));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringManager.noRouteFound),
        ),
        body: const Center(
          child: Text(StringManager.noRouteFound),
        ),
      ),
    );
  }
}