import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_hive_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  addNote(NoteModel note) {}
}
