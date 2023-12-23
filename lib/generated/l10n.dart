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

  /// `LexiLearn`
  String get appName {
    return Intl.message(
      'LexiLearn',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Already have account ?`
  String get haveAccount {
    return Intl.message(
      'Already have account ?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email {
    return Intl.message(
      'Email address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account ?`
  String get notHaveAccount {
    return Intl.message(
      'Don\'t have account ?',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `هل طفلك ممدد بالكتب الذي يحتاجها؟`
  String get q1 {
    return Intl.message(
      'هل طفلك ممدد بالكتب الذي يحتاجها؟',
      name: 'q1',
      desc: '',
      args: [],
    );
  }

  /// `هل طفلك حاليا يدرس فى المدرسة و يحضر بانتظام؟`
  String get q2 {
    return Intl.message(
      'هل طفلك حاليا يدرس فى المدرسة و يحضر بانتظام؟',
      name: 'q2',
      desc: '',
      args: [],
    );
  }

  /// `هل طاقم المعلمين فى المدرسة كفء و يجيدون شرح المنهج؟`
  String get q3 {
    return Intl.message(
      'هل طاقم المعلمين فى المدرسة كفء و يجيدون شرح المنهج؟',
      name: 'q3',
      desc: '',
      args: [],
    );
  }

  /// `هل تخلو البيئة المحيطة من المشاكل أسرية بين الوالدين؟`
  String get q4 {
    return Intl.message(
      'هل تخلو البيئة المحيطة من المشاكل أسرية بين الوالدين؟',
      name: 'q4',
      desc: '',
      args: [],
    );
  }

  /// `هل تخلو حياة طفلك من اى صورة من صور التنمر؟`
  String get q5 {
    return Intl.message(
      'هل تخلو حياة طفلك من اى صورة من صور التنمر؟',
      name: 'q5',
      desc: '',
      args: [],
    );
  }

  /// `هل البيئة الأسرية المحيطة توفر الدعم النفسي للطفل؟`
  String get q6 {
    return Intl.message(
      'هل البيئة الأسرية المحيطة توفر الدعم النفسي للطفل؟',
      name: 'q6',
      desc: '',
      args: [],
    );
  }

  /// `هل البيئة المحيطة بالطفل بها متعلمين (ليسوا أميون) بنسبة تزيد عن ٦٠%؟`
  String get q7 {
    return Intl.message(
      'هل البيئة المحيطة بالطفل بها متعلمين (ليسوا أميون) بنسبة تزيد عن ٦٠%؟',
      name: 'q7',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `مرحلة التشخيص`
  String get qAppBar {
    return Intl.message(
      'مرحلة التشخيص',
      name: 'qAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Let's Go`
  String get let {
    return Intl.message(
      'Let\'s Go',
      name: 'let',
      desc: '',
      args: [],
    );
  }

  /// `start`
  String get start {
    return Intl.message(
      'start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// ` “كلما كان التشخيص أفضل، كلما كان لديك علاج أفضل” لذا يرجى مساعدتنا في علاج طفلك من خلال قراءة الأسئلة التالية بدقة والإجابة عليها بمصداقية، الأسئلة التالية مصممة لضمان سلامة البيئة المحيطة بطفلك .`
  String get n {
    return Intl.message(
      ' “كلما كان التشخيص أفضل، كلما كان لديك علاج أفضل” لذا يرجى مساعدتنا في علاج طفلك من خلال قراءة الأسئلة التالية بدقة والإجابة عليها بمصداقية، الأسئلة التالية مصممة لضمان سلامة البيئة المحيطة بطفلك .',
      name: 'n',
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
