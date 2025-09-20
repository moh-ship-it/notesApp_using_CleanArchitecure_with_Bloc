part of 'bloc.dart';

abstract class BlocEvent {}

class AddNoteEvent extends BlocEvent {
  final String noteTitle;
  final String noteContent;
  AddNoteEvent({required this.noteTitle, required this.noteContent});
}

class DeleteNoteEvent extends BlocEvent {
  final int noteID;
  DeleteNoteEvent({required this.noteID});
}

class GetAllNotesEvent extends BlocEvent {}
