import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pictogram/firebase_options.dart';
import 'package:pictogram/layouts/mobile_layout.dart';
import 'package:pictogram/layouts/web_layout.dart';
import 'package:pictogram/screens/home_screen.dart';
import 'package:pictogram/screens/login_screen.dart';
import 'package:pictogram/screens/register_screen.dart';
import 'package:pictogram/utils/my_colors.dart';
import 'package:pictogram/layouts/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pictogram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: kMobileBackgroundColor),
      home: LoginScreen(),
    );
  }
}
