import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/notes_cubit/state.dart';

import '../models/archived/archived_screen.dart';
import '../models/done/done_screen.dart';
import '../models/home_notes/notes_screen.dart';
import '../models/settings/settings_screen.dart';
import '../moduals/notes_models/notes_model_data.dart';
import '../shared/components/widgets/add_bottom_sheet.dart';
import '../shared/style/constance.dart';

class NotesReadCubit extends Cubit<NotesReadStates> {
  NotesReadCubit() : super(NotesReadInitialState());

  static NotesReadCubit get(context) => BlocProvider.of(context);
  List<NotesModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    notes= notesBox.values.toList();
    // ignore: avoid_print
    print('featch done');

  }

  int currentIndex = 0;
  List<Widget> screens = [
    const LayoutHome(),
    const ArchivedScreen(),
    const AddNoteBottomSheet(),
    const DoneScreen(),
    const SettingsScreen(),
  ];

  changeCurrentIndex(int index) {
    currentIndex = index;
    emit(NotesChangeBottomNavBarState());
  }
}
