import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'add_bottom_sheet.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                  context: context,
                  builder: (context) {
                    return const AddNoteBottomSheet();
                  });
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
  }
}

