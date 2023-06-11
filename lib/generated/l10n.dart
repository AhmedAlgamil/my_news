// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My News`
  String get MyNews {
    return Intl.message(
      'My News',
      name: 'MyNews',
      desc: '',
      args: [],
    );
  }

  /// `Top Head Lines`
  String get TopHeadLine {
    return Intl.message(
      'Top Head Lines',
      name: 'TopHeadLine',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get Favourites {
    return Intl.message(
      'Favourite',
      name: 'Favourites',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get Sports {
    return Intl.message(
      'Sport',
      name: 'Sports',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get Business {
    return Intl.message(
      'Business',
      name: 'Business',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get Entertainment {
    return Intl.message(
      'Entertainment',
      name: 'Entertainment',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get General {
    return Intl.message(
      'General',
      name: 'General',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get Health {
    return Intl.message(
      'Health',
      name: 'Health',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get Technologies {
    return Intl.message(
      'Technology',
      name: 'Technologies',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get Science {
    return Intl.message(
      'Science',
      name: 'Science',
      desc: '',
      args: [],
    );
  }

  /// `Show all`
  String get ShowAll {
    return Intl.message(
      'Show all',
      name: 'ShowAll',
      desc: '',
      args: [],
    );
  }

  /// `More Details`
  String get moreDetails {
    return Intl.message(
      'More Details',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get Unknown {
    return Intl.message(
      'Unknown',
      name: 'Unknown',
      desc: '',
      args: [],
    );
  }

  /// `author`
  String get author {
    return Intl.message(
      'author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get Source {
    return Intl.message(
      'Source',
      name: 'Source',
      desc: '',
      args: [],
    );
  }

  /// `no description`
  String get noDescription {
    return Intl.message(
      'no description',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `no content`
  String get noContent {
    return Intl.message(
      'no content',
      name: 'noContent',
      desc: '',
      args: [],
    );
  }

  /// `no date`
  String get noDate {
    return Intl.message(
      'no date',
      name: 'noDate',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
