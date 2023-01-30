import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/add_notes/add_notes_screen.dart';
import 'package:notes/shared/components/widgets/navigate_and_finish.dart';
import '../../../notes_cubit/cubit.dart';
import '../../../notes_cubit/state.dart';


class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesReadCubit,NotesReadStates>(
      listener: (context,state){},
      builder: (context,state){
       var cubit=  NotesReadCubit.get(context);
        return ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.black12,
          elevation: 1.5,
          color: Colors.white,
          initialActiveIndex: cubit.currentIndex,
          curveSize: 125,
          height: 60,
          activeColor: Colors.amber.withOpacity(1.0),

          items: [
            const TabItem(
              icon: Icons.home,
              title: 'Home',
            ),
            const TabItem(icon: Icons.archive_outlined, title: 'Archived'),
            TabItem(
              icon: IconButton(
                onPressed: () {
                  navigate(context, AddNotesScreen());
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
                color: Colors.black,
              ),
              title: 'Add',
            ),
            const TabItem(icon: Icons.done_outline, title: 'done'),
            const TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          onTap: (index) {
            cubit.changeCurrentIndex(index);
            print(index);
          },
        ) ;
      },
    );
  }
}

