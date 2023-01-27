import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';

class NoteItemsBuilder extends StatelessWidget {
const     NoteItemsBuilder({Key? key, required this.note,}) : super(key: key);
final NotesModel note;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
      child: Column(
        children: [
          Card(
            elevation: 1.8,
            color: const Color(0xfffaee9e),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Slidable(
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.blueAccent,
                      icon: Icons.check_box,
                      flex: 2,
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        // ignore: avoid_print
                        print('object');
                      }),
                      flex: 2,
                      backgroundColor: Colors.black,
                      icon: Icons.archive_outlined,
                    )
                  ]),
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      backgroundColor: Colors.red,
                      flex: 3,
                      icon: Icons.delete_forever_outlined,
                    )
                  ]),
                  child: ListTile(
                    title: Row(
                      children: [
                         Text(
                          maxLines: 1,
                          note.title,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          note.date,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black,fontSize: 4,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          note.subTitle,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: 'cairo'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
