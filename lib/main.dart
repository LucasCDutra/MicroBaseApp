import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:micro_app_home/app/micro_app_home_resolver.dart';

import 'package:micro_core/micro_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with BaseApp {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.registerRouters();
    return MaterialApp(
      title: 'MicroApps',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/home',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppHomeResolver(),
      ];
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
