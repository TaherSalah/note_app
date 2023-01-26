import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/shared/cubit/cubit.dart';
import '../../shared/components/widgets/custom_nav_bar.dart';
import '../notes_cubit/cubit.dart';
import '../notes_cubit/state.dart';
import '../shared/components/widgets/add_bottom_sheet.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

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
            child: const Icon(Icons.add,size: 25),
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

// AppBar(
//
// title: Row(children: [
// Image.asset('assets/images/logo 2.png',),
// Text(
// 'Notes',
// style: Theme.of(context)
// .textTheme
//     .bodyText1!
// .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
// ),
// ],),
// actions: [
// IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
// ],
// ),
