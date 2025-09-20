import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';

abstract class BlocState {}

class NoteInitional extends BlocState {}

class NoteLoading extends BlocState {}

class NoteLoaded extends BlocState {
  final List<NoteEntity> notes;
  NoteLoaded({required this.notes});
}

class NoteError extends BlocState {
  final String message;
  NoteError({required this.message});
}
