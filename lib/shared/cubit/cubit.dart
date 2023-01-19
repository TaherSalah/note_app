import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/shared/cubit/state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());


}
