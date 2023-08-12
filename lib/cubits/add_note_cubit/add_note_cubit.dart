import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_hive_app/constant.dart';
import 'package:notes_hive_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      // add<String>('hassan');
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } on Exception catch (e) {
      emit(AddNoteFailureState(errorMessage: e.toString()));
    }
  }

// //generic
//   T add<T>(T name) {
//     // T
//     return name;
//   }
}
