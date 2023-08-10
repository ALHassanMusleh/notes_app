import 'package:flutter/material.dart';
import 'package:notes_hive_app/views/widgets/custom_app_bar.dart';
import 'package:notes_hive_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(
            height: 45,
          ),
          CustomAppBar(
            title: 'Edit Notes',
            icon: Icons.check,
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(hintText: 'Title'),
          SizedBox(
            height: 15,
          ),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
