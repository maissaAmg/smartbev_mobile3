import 'package:flutter/material.dart';
import 'package:login/Screens/welcome_screen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final fontLoader = FontLoader('Helvetica Neue')
    ..addFont(rootBundle.load('assets/fonts/Helvetica Neue Regular.otf'));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0xFFFBFCFF),
          scaffoldBackgroundColor: const Color(0xFFEBDBCD),
          secondaryHeaderColor: const Color(0xFFD47E3E)),
      home: Scaffold(
        body: StreamBuilder(
          builder: ((context, snapshot) {
            return const WelcomeScreen();
          }),
        ),
      ),
    );
  }
}
