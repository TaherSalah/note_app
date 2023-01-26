import 'package:notes/moduals/notes_models/notes_model_data.dart';

abstract class NotesReadStates {}

class NotesReadInitialState extends NotesReadStates {}

class NotesReadLoadingState extends NotesReadStates {}

class NotesReadSuccessState extends NotesReadStates {
  final List<NotesModel>notes;

  NotesReadSuccessState(this.notes);
}

class NotesReadErrorState extends NotesReadStates {
  final String? error;

  NotesReadErrorState(this.error);

}

class NotesChangeBottomNavBarState extends NotesReadStates {}






