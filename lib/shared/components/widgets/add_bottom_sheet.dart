import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/notes_cubit/cubit.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/cubit/state.dart';
import 'form.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement
    BlocProvider.of<NotesReadCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesStates>(
        listener: (context, state) {
          if (state is NotesErrorState) {
            // ignore: avoid_print
            print(state.error.toString());
          }
          if (state is NotesSuccessState) {
            // ignore: avoid_print
            BlocProvider.of<NotesReadCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            debugPrint('error');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is NotesLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNotesForm()),
            ),
          );
        },
      ),
    );
  }
}
