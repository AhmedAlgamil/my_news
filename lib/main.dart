import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:g_news/presentation/screens/home_screen.dart';
import 'package:g_news/shared/network/dio_helper.dart';

import 'generated/l10n.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      darkTheme: ThemeData(
        useMaterial3: true,
      ),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      title: "اخباري",
      home: const HomeScreen(),
    );
  }
}
