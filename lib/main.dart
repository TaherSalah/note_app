import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/notes_cubit/cubit.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/style/constance.dart';
import 'bloc_observer.dart';
import 'layout/layout_screen.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  //// open box ////
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesReadCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black12)),
        home: const NotesScreen(),
      ),
    );
  }
}
