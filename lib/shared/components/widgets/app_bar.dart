import 'package:flutter/material.dart';
import 'package:notes/shared/components/widgets/search_bar.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text('Notes',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30,fontWeight: FontWeight.bold),),
        const Spacer(),
        const CustomSearchBar()
      ],
    );
  }
}





