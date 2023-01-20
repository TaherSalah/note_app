import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/widgets/notes_list_view.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';


class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 14,),

                Expanded(
                  child: ListView.separated(
                      physics:const BouncingScrollPhysics(),
                      itemBuilder: (context,i)=>const ListViewBuilder(),
                      separatorBuilder:(context,i)=>const SizedBox(height: 1,) , itemCount: 4),
                ),

              ],

            ),
          ),
        );
      },
    );
  }
}
