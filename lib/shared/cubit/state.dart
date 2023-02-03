abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesLoadingState extends NotesStates {}

class NotesSuccessState extends NotesStates {
  // final String success;
  //
  // NotesSuccessState(this.success);
}

class NotesErrorState extends NotesStates {
  final String? error;

  NotesErrorState(this.error);

}

class NotesChangeBottomNavBarState extends NotesStates {}

