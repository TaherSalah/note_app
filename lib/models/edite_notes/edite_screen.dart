import 'package:flutter/material.dart';

import '../../shared/components/widgets/button.dart';
import '../../shared/components/widgets/text_field.dart';

class EditeScreen extends StatelessWidget {
  const EditeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edite Notes',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Edit Your Note Now !!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold))),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: 30,
                  color: Colors.amber,
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  height: 2,
                  width: 50,
                  color: Colors.amber,
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  height: 2,
                  width: 30,
                  color: Colors.amber,
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              vertical: 8,
            )),
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomFormField(
                hint: 'Note Title',

              ),
            ),
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomFormField(
                hint: 'Note Description',
                maxLines: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: defaultButton(
                context: context,
                name: 'Save Change ',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
