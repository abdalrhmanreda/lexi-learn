import 'package:flutter/material.dart';
import 'package:lexi_learn/config/routes/routes_path.dart';
import 'package:lexi_learn/ui/features/authentication/screens/choose_loging_or_register/choose_loging_or_register.dart';
import 'package:lexi_learn/ui/features/let_start_screen/let_start_screen.dart';
import 'package:lexi_learn/ui/features/questionair_screen/screens/questionair_screen.dart';
import 'package:lexi_learn/ui/features/questions_screen/screens/question_screen.dart';

import '../../ui/features/authentication/screens/login_screen/login_screen.dart';
import '../../ui/features/authentication/screens/register_screen/register_screen.dart';
import '../../ui/features/splash_screen/screens/splash_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RoutePath.choose:
      return MaterialPageRoute(builder: (_) => const ChooseScreen());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case RoutePath.signUp:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case RoutePath.question:
      return MaterialPageRoute(builder: (_) => Questionnaire());
    case RoutePath.let:
      return MaterialPageRoute(builder: (_) => const LetStartScreen());
    case RoutePath.test:
      return MaterialPageRoute(builder: (_) => const QuestionScreen());
    // case RoutePath.layout:
    //   return MaterialPageRoute(builder: (_) => const LayoutScreen());
    // case RoutePath.editProfile:
    //   return MaterialPageRoute(builder: (_) => const EditProfileScreen());
    // case RoutePath.search:
    //   return MaterialPageRoute(builder: (_) => const SearchScreen());
    // case RoutePath.help:
    //   return MaterialPageRoute(builder: (_) => const HelpAndSupportScreen());
  }
}
