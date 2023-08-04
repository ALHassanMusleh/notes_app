import 'package:flutter/material.dart';
import 'package:notes_hive_app/views/widgets/custom_app_bar.dart';

import 'notes_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
      child: Column(
        children: const [
          CustomAppBar(),
          Expanded(
            child: NotesListView(),
          ), //Expanded inside Row or column this is flex widget
        ],
      ),
    );
  }
}


