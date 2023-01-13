import 'package:flutter/material.dart';
import '../../shared/components/widgets/custom_items_builder.dart';
import '../../shared/components/widgets/custom_nav_bar.dart';
import '../../shared/components/widgets/notes_list_view.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          physics:const BouncingScrollPhysics(),
            itemBuilder: (context,i)=>const ListViewBuilder(),
            separatorBuilder:(context,i)=>const SizedBox(height: 1,) , itemCount: 4)
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

