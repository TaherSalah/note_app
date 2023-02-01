import 'package:flutter/material.dart';
import 'package:notes/models/edite_notes/edite_screen.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/shared/components/widgets/navigate_and_finish.dart';

import 'items_builder.dart';

class ListViewBuilder extends StatelessWidget {
   const ListViewBuilder({Key? key, required this.note}) : super(key: key);
final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        InkWell(
          onTap: (){
            navigate(context,  EditeScreen(notesModel: note,));
          },
            child:  NoteItemsBuilder(note: note,))
      ],
    );
  }
}
