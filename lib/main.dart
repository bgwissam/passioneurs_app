import 'package:flutter/material.dart';
import 'package:passioneurs/authentication/sign_in.dart';
import 'package:passioneurs/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as appLoc;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _loggedIn = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      title: 'Passioneurs',
      localizationsDelegates: [
        appLoc.AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _loggedIn ? HomeLandingPage() : LoginPage(),
    );
  }
}
