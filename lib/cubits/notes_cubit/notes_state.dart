part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitialState extends NotesState {}

// class NotesLoadingState extends NotesState {}

// class NotesSuccessState extends NotesState {
//   final List<NoteModel> notes;

//   NotesSuccessState({required this.notes});
// }

// class NotesFailureState extends NotesState {
//   final String errorMessage;

//   NotesFailureState({required this.errorMessage});
// }
