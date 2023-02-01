import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/notes_cubit/cubit.dart';
import 'package:notes/notes_cubit/state.dart';

import '../../shared/components/widgets/button.dart';
import '../../shared/components/widgets/text_field.dart';

class EditeScreen extends StatefulWidget {
  EditeScreen({Key? key, required this.notesModel}) : super(key: key);

  @override
  State<EditeScreen> createState() => _EditeScreenState();
  final NotesModel notesModel;
}

class _EditeScreenState extends State<EditeScreen> {
  String? title, subtitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesReadCubit, NotesReadStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Edite Notes',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Edit Your Note Now !!',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 2,
                      width: 50,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.amber,
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(
                  vertical: 8,
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomFormField(
                    hint: widget.notesModel.title,
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomFormField(
                    hint: widget.notesModel.subTitle,
                    maxLines: 18,
                    onChanged: (value) {
                      subtitle = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defaultButton(
                    context: context,
                    name: 'Save Change ',
                    onPressed: () {
                      widget.notesModel.title =
                          title ?? widget.notesModel.title;
                      widget.notesModel.subTitle =
                          subtitle ?? widget.notesModel.subTitle;
                      widget.notesModel.save();
                      BlocProvider.of<NotesReadCubit>(context).fetchAllNotes();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
