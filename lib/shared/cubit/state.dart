abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesLoadingState extends NotesStates {}

class NotesSuccessState extends NotesStates {}

class NotesErrorState extends NotesStates {
  final String? error;

  NotesErrorState(this.error);

}
