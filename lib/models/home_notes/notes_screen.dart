import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/moduals/notes_models/notes_model_data.dart';

import '../../notes_cubit/cubit.dart';
import '../../notes_cubit/state.dart';
import '../../shared/components/widgets/notes_list_view.dart';

class LayoutHome extends StatefulWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<NotesReadCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesReadCubit, NotesReadStates>(
      builder: (context, state) {
        var cubit=BlocProvider.of<NotesReadCubit>(context).notes??[];
        // List<NotesModel> cubit =
        //     BlocProvider.of<NotesReadCubit>(context).notes!;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 14,
                ),
                Expanded(
                  child: ListView.separated(
                      physics:  BouncingScrollPhysics(),
                      itemBuilder: (context, i) =>  ListViewBuilder(note: cubit[i]),
                      separatorBuilder: (context, i) => const SizedBox(
                            height: 1,
                          ),
                      itemCount: cubit.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
