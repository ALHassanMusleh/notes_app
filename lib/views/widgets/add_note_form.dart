import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_hive_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_hive_app/helper/show_snack_bar.dart';
import 'package:notes_hive_app/models/note_model.dart';
import 'package:notes_hive_app/views/widgets/color_list_view.dart';
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
        mainAxisSize: MainAxisSize.min,
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
          const ColorsListView(),
          const SizedBox(
            height: 35,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoadingState ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var cuttentDate = DateTime.now();
                    var formatCurrenState =
                        // DateFormat('dd-mm-yyyy').format(cuttentDate);
                        DateFormat.yMd().format(cuttentDate);

                    NoteModel note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formatCurrenState,
                      color: BlocProvider.of<AddNoteCubit>(context).color.value,
                    );

                    showSnackBar(context, 'Added Note Succeffully',
                        backgroundcolor: Colors.green);

                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
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
