import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/shared/cubit/state.dart';

import '../../cubit/cubit.dart';

class ColorsItemsBuilder extends StatefulWidget {
  ColorsItemsBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorsItemsBuilder> createState() => _ColorsItemsBuilderState();
  int currentIndex = 0;

   List<Color> colorList = const [
    Color(0xffFEFCF3),
    Color(0xffF5EBE0),
    Color(0xffF0DBDB),
    Color(0xffDBA39A),
    Color(0xffADA2FF),
    Color(0xffC0DEFF),
    Color(0xffFFE5F1),
    Color(0xffFFF8E1),
  ];
}

class _ColorsItemsBuilderState extends State<ColorsItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit,NotesStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  SizedBox(
            height: 25 * 2,
            child: ListView.builder(
              itemCount: widget.colorList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      widget.currentIndex = index;
                      BlocProvider.of<AddNotesCubit>(context).color=widget.colorList[index];
                      print('gjgfjhj');

                      setState(() {});
                    },
                    child: ColorList(
                      isActive: widget.currentIndex == index,
                      color: widget.colorList[index],
                    ));
              },
            ),
          );
        },

      ),
    );
  }
}

class ColorList extends StatefulWidget {
  ColorList({Key? key, required this.isActive, required this.color})
      : super(key: key);

  @override
  State<ColorList> createState() => _ColorListState();
  final bool isActive;
  final Color color;
}

class _ColorListState extends State<ColorList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: widget.isActive
          ? const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 23,
          )
          : CircleAvatar(
              backgroundColor: widget.color,
              radius: 25,
            ),
    );
  }
}
