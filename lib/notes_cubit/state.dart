
abstract class NotesReadStates {}

class NotesReadInitialState extends NotesReadStates {}

class NotesReadLoadingState extends NotesReadStates {}

class NotesReadSuccessState extends NotesReadStates {

}

class NotesReadErrorState extends NotesReadStates {
  final String? error;

  NotesReadErrorState(this.error);

}

class NotesChangeBottomNavBarState extends NotesReadStates {}






