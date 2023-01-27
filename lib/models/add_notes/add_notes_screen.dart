import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../moduals/notes_models/notes_model_data.dart';
import '../../shared/components/widgets/button.dart';
import '../../shared/components/widgets/text_field.dart';
import '../../shared/components/widgets/validation.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:const SingleChildScrollView(child:  AddNotesForm()) ,
    );
  }
}

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NotesCubit.get(context);
          return Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
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
                      color: Colors.red,
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(
                  vertical: 8,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomFormField(
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
                    hint: 'Title Description',
                    maxLines: 20,
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
                            date: DateTime.now().toString(),
                            color: Colors.orange.value);
                        cubit.addNotes(notesModel);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
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