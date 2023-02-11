import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/notes_cubit/cubit.dart';
import 'package:notes/shared/components/widgets/text_field.dart';
import 'package:notes/shared/components/widgets/validation.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/cubit/state.dart';

import 'button.dart';
import 'colors_list_view.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, NotesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DateTime dateTime = DateTime.now();
          var formateCurrentDate =
              DateFormat('yyyy-MM-dd KK:mm:ss').format(dateTime);
          var cubit = AddNotesCubit.get(context);
          return Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text('Add New Notes',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.red,
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
                    maxLength: 35,

                    hint: 'Note Title',
                    onSaved: (value) {
                      title = value;
                    },
                    onChanged: (value) {},
                    validator: Validator.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomFormField(
                    maxLines: 15,
                    hint: 'Title Description',
                    onSaved: (value) {
                      subTitle = value;
                    },
                    onChanged: (value) {},
                    validator: Validator.name,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ColorsItemsBuilder(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defaultButton(
                    context: context,
                    name: 'Add Notes',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var notesModel = NotesModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: formateCurrentDate,
                            color: Colors.orange.value);
                        cubit.addNotes(notesModel);
                        
                        BlocProvider.of<NotesReadCubit>(context)
                            .fetchAllNotes();

                        Navigator.pop(context);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
