import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AddNotesForm(),
    );
  }
}
class AddNotesForm extends StatefulWidget {
  const AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final   GlobalKey<FormState> formKey= GlobalKey() ;
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  String? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomFormField(
              hint: 'Note Title',
              onSaved: (value){
                title=value;
              },
              onChanged: (value){},
              validator: (value){
                if(value?.isEmpty??true){
                  return 'faild is empty';
                }
              },

            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomFormField(
              hint: 'Title Description',
              maxLines: 6,
              onSaved: (value){
                subtitle=value;
              },
              onChanged: (value){},
              validator: (value){
                if(value?.isEmpty??true){
                  return 'faild is empty';
                }
              },
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
              onPressed: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  autovalidateMode=AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
