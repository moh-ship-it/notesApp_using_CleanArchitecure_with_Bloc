// import /'package:clean_architecture_using_bloc/core/resources/data_state.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';

abstract class NoteRepositore {
  Future<void> createNome({required NoteEntity note});
  Future<List<NoteEntity>> getAllNotes();
  Future<void> updateNote(NoteEntity note);
  Future<void> deleteNote(int noteId);
}
