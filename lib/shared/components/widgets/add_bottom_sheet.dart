import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/shared/cubit/cubit.dart';
import 'package:notes/shared/cubit/state.dart';
import 'form.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: BlocConsumer<NotesCubit,NotesStates>(
        listener: (context,state){
          if(state is NotesErrorState){
            print(state.error.toString());
          }
          if(state is NotesSuccessState){

            Navigator.pop(context);
          }
        },
        builder: (context,state){
          return ModalProgressHUD(
              inAsyncCall: state is NotesLoadingState ?true:false,
              child:const AddNotesForm());
        },
      ),
    );
  }
}

