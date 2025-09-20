import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/repositories/note_repositore.dart';

class GetNotesUseseCase {
  final NoteRepositore _noteRepositore;
  GetNotesUseseCase(this._noteRepositore);

  Future<List<NoteEntity>> call() {
    return _noteRepositore.getAllNotes();
  }
}
