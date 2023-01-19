import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/models/onBoarding/onBoarding_screen.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/shared/style/constance.dart';


void main()async {
  await Hive.initFlutter();
  //// open box ////
 await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NotesModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black12
        )
      ),
      home: const OnBoardingScreen(),
    );
  }
}
