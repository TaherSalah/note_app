import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/shared/components/widgets/navigate_and_finish.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/cubit/state.dart';
import '../../../models/add_notes/add_notes_screen.dart';
import 'add_bottom_sheet.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.black12,
          elevation: 1.5,
          color: Colors.white,
          initialActiveIndex: 1,
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
                  navigate(context, const AddNotesScreen());
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
          onTap: (i) {},
        );
      },
    );
  }
}
