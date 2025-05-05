import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:submission1/common/url_strategy_web.dart';
import 'package:submission1/core/repository/auth_repository.dart';
import 'package:submission1/core/repository/stories_repository.dart';
import 'package:submission1/provider/auth_provider.dart';
import 'package:submission1/provider/file_provider.dart';
import 'package:submission1/provider/stories_provider.dart';
import 'package:submission1/routes/router_delegate.dart';
import 'package:submission1/styles/theme_style.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyRouterDelegate myRouterDelegate;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthRepository()),
        Provider(create: (context) => StoriesRepository()),
        ChangeNotifierProvider(
          create: (context) {
            return StoriesProvider(context.read<StoriesRepository>());
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return AuthProvider(context.read<AuthRepository>());
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return FileProvider();
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeStyle.lightTheme,
        title: "Majang Apps",
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('id', ''), Locale('en', '')],
        home: Builder(
          builder: (context) {
            return Router(
              routerDelegate: myRouterDelegate,
              backButtonDispatcher: RootBackButtonDispatcher(),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final AuthRepository authRepository = AuthRepository();
    myRouterDelegate = MyRouterDelegate(authRepository);
  }
}
