import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lexi_learn/config/routes/routes_path.dart';
import 'package:lexi_learn/ui/cubit/app_cubit.dart';
import 'package:lexi_learn/ui/features/authentication/controller/auth_cubit.dart';

import 'config/routes/router.dart';
import 'config/themes/themes.dart';
import 'core/cache/hive_cache.dart';
// import 'firebase_options.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'ui/cubit/observer/blocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  await HiveCache.openHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthCubit()),
              BlocProvider(create: (context) => AppCubit()),
            ],
            child: MaterialApp(
              initialRoute: RoutePath.test,
              onGenerateRoute: generateRoute,
              locale: const Locale('ar', 'US'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: Style.lightTheme,
              darkTheme: Style.darkTheme,
              themeMode: ThemeMode.light,
            ),
          ),
        );
      },
    );
  }
}
