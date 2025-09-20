import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';

// class NoteModel extends NoteEntity {
//   const NoteModel({
//     final int? id,
//     final String? noteTitle,
//     final String? noteContent,
//     final DateTime? addTime,
//   });
//   factory NoteModel.fromJson(Map<String, dynamic> map) {
//     return NoteModel(
//       id: map['id'],
//       noteTitle: map['noteTitle'] ?? "",
//       noteContent: map['noteContent'] ?? "",
//       addTime: map['addTime'] ?? "",
//     );
//   }
// }

class NoteModel {
  final int? id;
  final String noteTitle;
  final String noteContent;
  final int addTime;

  const NoteModel({
    this.id,
    required this.noteTitle,
    required this.noteContent,
    required this.addTime,
  });

  // من Map (من قاعدة البيانات) إلى Model
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as int?,
      noteTitle: map['noteTitle'] as String,
      noteContent: map['noteContent'] as String,
      addTime: map['addTime'] as int,
    );
  }
  // 2. تحويل من Entity (من طبقة Domain) إلى Model
  // تحويل من Entity (من طبقة Domain) إلى Model
  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      id: entity.id,
      noteTitle: entity.noteTitle ?? '',
      noteContent: entity.noteContent ?? '',
      addTime:
          entity.addTime ?? 0, // هنا يتم الإسناد مباشرة لأنهما من نفس النوع
    );
  }
  // من Model إلى Map (للحفظ في قاعدة البيانات)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'noteTitle': noteTitle,
      'noteContent': noteContent,
      'addTime': addTime,
    };
  }

  // تحويل Model إلى Entity
  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      noteTitle: noteTitle,
      noteContent: noteContent,
      addTime: addTime,
    );
  }
}
