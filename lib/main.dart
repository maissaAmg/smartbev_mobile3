import 'package:flutter/material.dart';
import 'package:login/Screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
