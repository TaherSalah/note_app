import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/cubit/state.dart';
import '../../shared/components/widgets/custom_nav_bar.dart';
import '../notes_cubit/cubit.dart';
import '../notes_cubit/state.dart';
import '../shared/components/widgets/add_bottom_sheet.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NotesReadCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesReadCubit, NotesReadStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesReadCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Text('Notes Taskes'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.dark_mode)),
                  ],
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            child: const Icon(Icons.add, size: 25),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  context: context,
                  builder: (context) {
                    return const AddNoteBottomSheet();
                  });

            },
          ),
        );
      },
    );
  }
}
