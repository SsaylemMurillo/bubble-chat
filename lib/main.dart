import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/helper/helper_function.dart';
import 'package:flutter_chat_app/pages/auth/login_page.dart';
import 'package:flutter_chat_app/pages/home_page.dart';
import 'package:flutter_chat_app/shared/constants.dart';
import 'package:flutter_chat_app/theme/theme.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // run web
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    // run android
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
