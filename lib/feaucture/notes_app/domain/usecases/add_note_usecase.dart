import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/repositories/note_repositore.dart';

class AddNoteUsesCase {
  final NoteRepositore _noteRepositore;
  AddNoteUsesCase(this._noteRepositore);

  Future<void> call(NoteEntity note) {
    return _noteRepositore.createNome(note: note);
  }
}
