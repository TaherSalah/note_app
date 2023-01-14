import 'package:flutter/material.dart';
import 'package:notes/models/edite_notes/edite_screen.dart';
import 'package:notes/shared/components/widgets/navigate_and_finish.dart';

import 'items_builder.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children:  [
            InkWell(
              onTap: (){
                navigate(context, const EditeScreen());
              },
                child: const NoteItemsBuilder())
          ],
        ),
        // const Positioned(
        //     top:190,
        //     left: 30,
        //     child: CircleAvatar(
        //       backgroundColor:  Color(0xffFF5328),
        //       child: Icon(Icons.delete_forever_outlined,color: Colors.white),
        //     )),
        // const Positioned(
        //     top:190,
        //     right: 170,
        //     child: CircleAvatar(
        //       backgroundColor:  Color(0xff4C9CFE),
        //
        //       child: Icon(Icons.check_box,color: Colors.white),
        //     )),
        // const Positioned(
        //     top:190,
        //     right: 30,
        //     child: CircleAvatar(
        //       child: Icon(Icons.archive_outlined,color: Colors.white),
        //     )),
      ],
    );
  }
}
