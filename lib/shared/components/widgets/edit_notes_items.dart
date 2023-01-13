import 'package:flutter/material.dart';

import 'app_bar.dart';

class EditeNotesItems extends StatelessWidget {
  const EditeNotesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppBar()
      ],
    );
  }
}
