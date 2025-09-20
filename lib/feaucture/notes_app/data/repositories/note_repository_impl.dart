import 'package:clean_architecture_using_bloc/feaucture/notes_app/data/models/note_model.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/repositories/note_repositore.dart';
import 'package:sqflite/sqflite.dart';

import '../data_source/local/database_helper.dart';

// هذا الكلاس هو الجزء الذي يتصل مباشرة بقاعدة البيانات
class NoteRepositoryImpl extends NoteRepositore {
  final DatabesHelper _databesHelper;
  NoteRepositoryImpl(this._databesHelper);

  //     function to Add New note
  @override
  Future<void> createNome({required NoteEntity note}) async {
    final db = await _databesHelper.database;
    await db.insert(
      'notes',
      NoteModel.fromEntity(note).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //  function to delete  note
  @override
  Future<void> deleteNote(int noteId) async {
    final db = await _databesHelper.database;
    await db.delete('notes', where: 'id = ?', whereArgs: [noteId]);
  }

  //            function to Get all notes
  @override
  Future<List<NoteEntity>> getAllNotes() async {
    final db = await _databesHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return NoteModel.fromMap(maps[i]).toEntity();
    });
  }

  //                function to update note
  @override
  Future<void> updateNote(NoteEntity note) async {
    final db = await _databesHelper.database;
    final values = NoteModel.fromEntity(note).toMap();
    await db.update('notes', values, where: 'id = ?', whereArgs: [note.id]);
  }
}
