


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/cubit/state.dart';
import '../../shared/components/widgets/custom_nav_bar.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =NotesCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              title: Text('Notes Taskes'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon:const Icon(Icons.search)),
                      IconButton(onPressed: (){}, icon:const Icon(Icons.dark_mode)),
                    ],
                  ),
                ),

              ],
            ),
            body:cubit.screens[cubit.currentIndex],
            bottomNavigationBar: const CustomBottomNavBar()

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