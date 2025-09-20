// import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/repositories/note_repositore.dart';

class DeleteNoteUseCase {
  final NoteRepositore _noteRepositore;
  DeleteNoteUseCase(this._noteRepositore);

  Future<void> call(int noteId) {
    return _noteRepositore.deleteNote(noteId);
  }
}
