import 'package:flutter/material.dart';

import '../presentation/ressource/color_manager.dart';
import '../presentation/ressource/size_manager.dart';
import '../presentation/ressource/style_manager.dart';

loading(String message) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: getMediumStyle(color: ColorManager.black),
          ),
          const SizedBox(
            height: SizeManager.s10,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    ),
  );
}
