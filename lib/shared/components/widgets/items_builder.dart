import 'package:flutter/material.dart';

class NoteItemsBuilder extends StatelessWidget {
  const NoteItemsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:6.0,right: 6,bottom: 6.5),
      child: Column(
        children: [
          Card(
            elevation: 1.8,
            color: const Color(0xfffaee9e),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      const Text(
                        maxLines: 1,
                        'Go To GYM',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        'May,7,2023',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.0),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        'simply dummy text of the printing text of the printing atext of the printing atext of the printing atext of the printing atext of the printing a and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            color: Colors.black,
                            fontFamily: 'cairo'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
