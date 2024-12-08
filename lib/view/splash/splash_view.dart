import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/resources/app_extentions.dart';
import 'package:myapp/resources/asset_manager.dart';
import 'package:myapp/resources/color_manager.dart';
import 'package:myapp/resources/routes_manager.dart';
import 'package:myapp/resources/string_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    counter();
    super.initState();
  }

  void counter() async {
    await Future.delayed(const Duration(seconds: 2));
    context.pushReplacementNamed(RoutesNames.homeRoute);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetManager.appLogo,
              height: 200,
              width: 200,
            ),
            Text(StringManager.splashText,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: ColorManager.whiteColor)),
            Image.asset(
              AssetManager.splashCar,
              height: context.width * 0.4,
              width: context.height * 0.5,
            )
          ],
        ),
      ),
    );
  }
}
