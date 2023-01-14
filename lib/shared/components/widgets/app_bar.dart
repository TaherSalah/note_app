import 'package:flutter/material.dart';
import 'package:notes/shared/components/widgets/search_bar.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
padding: EdgeInsets.symmetric(vertical: 10),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
    children:  [
    Text('Note Tasks',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 26,fontWeight: FontWeight.bold),),
    const Spacer(),
    const CustomSearchBar()
    ],
    ),
        )
    );

  }
}





