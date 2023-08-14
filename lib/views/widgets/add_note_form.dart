import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_hive_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_hive_app/models/note_model.dart';
import 'package:notes_hive_app/views/widgets/custom_button.dart';
import 'package:notes_hive_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                NoteModel note = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: DateTime.now().toString(),
                  color: Colors.blue.value,
                );

                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
