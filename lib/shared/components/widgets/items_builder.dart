import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/notes_cubit/cubit.dart';
import 'package:notes/notes_cubit/state.dart';
import 'package:notes/shared/components/show_toast.dart';

import '../../../models/done/done_screen.dart';

class NoteItemsBuilder extends StatefulWidget {
  const NoteItemsBuilder({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NotesModel note;

  @override
  State<NoteItemsBuilder> createState() => _NoteItemsBuilderState();
}

class _NoteItemsBuilderState extends State<NoteItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesReadCubit, NotesReadStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<NotesReadCubit>(context);
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
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoneScreen(
                                              note: widget.note,
                                            )));

                                BlocProvider.of<NotesReadCubit>(context)
                                    .fetchAllNotes();
                              });
                            }),
                            flex: 2,
                            backgroundColor: Colors.black,
                            icon: Icons.archive_outlined,
                          )
                        ]),
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: ((context) {
                              widget.note.delete();
                              showToast(
                                  state: ToastStates.warning,
                                  text: 'Delete Notes Done');
                              cubit.fetchAllNotes();
                            }),
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
                                widget.note.title,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                widget.note.date,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                textAlign: TextAlign.justify,
                                maxLines: 2,
                                widget.note.subTitle,
                                style: const TextStyle(
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
        });
  }
}
