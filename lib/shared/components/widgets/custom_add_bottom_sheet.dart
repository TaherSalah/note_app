import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Add New Notes',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold))),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 2,
                width: 30,
                color: Colors.red,
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
              maxLines: 6,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: defaultButton(
              context: context,
              name: 'Add Notes',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
