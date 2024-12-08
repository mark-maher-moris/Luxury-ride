import 'package:flutter/material.dart';
import 'package:myapp/resources/color_manager.dart';
import 'package:myapp/resources/string_manager.dart';
import 'package:myapp/view/change_language_view.dart';
import 'package:myapp/view/home/home_view.dart';
import 'package:myapp/view/splash/splash_view.dart';

class RoutesNames {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String chooseLanguageView = '/chooseLanguageView';
}

Map<String, WidgetBuilder> routes = {
  RoutesNames.splashRoute: (context) => const SplashView(),
  RoutesNames.loginRoute: (context) => const Placeholder(),
  RoutesNames.registerRoute: (context) => const Placeholder(),
  RoutesNames.homeRoute: (context) => const HomeView(),
  RoutesNames.chooseLanguageView: (context) => const ChooseLanguageView(),
};

onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.splashRoute:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case RoutesNames.loginRoute:
      return MaterialPageRoute(builder: (_) => const Placeholder());
    case RoutesNames.registerRoute:
      return MaterialPageRoute(builder: (_) => const Placeholder());
    case RoutesNames.homeRoute:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case RoutesNames.chooseLanguageView:
      return MaterialPageRoute(builder: (_) => const ChooseLanguageView());
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          StringManager.pageNotFound,
          style: TextStyle(color: ColorManager.whiteColor),
        ),
      ),
    );
  }
}
