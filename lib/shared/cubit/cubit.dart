import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';
import 'package:notes/shared/cubit/state.dart';
import 'package:notes/shared/style/constance.dart';

class AddNotesCubit extends Cubit<NotesStates> {
  AddNotesCubit() : super(NotesInitialState());

  static AddNotesCubit get(context) => BlocProvider.of(context);
// Color color=CupertinoColors.white;
  Color color = const Color(0xffFEFCF3);
  addNotes(NotesModel notesModel) async {
    notesModel.color=color.value;
    emit(NotesLoadingState());
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    await notesBox.add(notesModel).then((value) {
      emit(NotesSuccessState());
      // ignore: avoid_print
      print(value.toString());
    }).catchError((error) {
      emit(NotesErrorState(error.toString()));
      // ignore: avoid_print
      // print(error.toString());
    });
  }


}
