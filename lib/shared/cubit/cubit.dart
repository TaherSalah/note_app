import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/archived/archived_screen.dart';
import 'package:notes/models/done/done_screen.dart';
import 'package:notes/models/home_notes/notes_screen.dart';
import 'package:notes/models/settings/settings_screen.dart';
import 'package:notes/shared/components/widgets/add_bottom_sheet.dart';
import 'package:notes/shared/cubit/state.dart';


class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

static NotesCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const LayoutHome(),
    const ArchivedScreen(),
    // const AddNoteBottomSheet(),
    const DoneScreen(),
    const SettingsScreen(),
  ];

  changeCurrentIndex(int index) {
    currentIndex = index;
    emit(NotesChangeBottomNavBarState());
  }
}
