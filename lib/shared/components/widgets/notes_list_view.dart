import 'package:flutter/material.dart';
import 'package:notes/models/edite_notes/edite_screen.dart';
import 'package:notes/shared/components/widgets/navigate_and_finish.dart';

import 'items_builder.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children:  [
            InkWell(
              onTap: (){
                navigate(context, const EditeScreen());
              },
                child: const NoteItemsBuilder())
          ],
        ),

      ],
    );
  }
}
