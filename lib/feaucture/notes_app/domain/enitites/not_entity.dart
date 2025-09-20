import 'package:equatable/equatable.dart';

// class ArticalEntity extends Equatable {
//   final int? id;
//   final String? author;
//   final String? title;
//   final String? description;
//   final String? url;
//   final String? urlToImage;
//   final String? publishedAt;
//   final String? content;
//
//   const ArticalEntity({
//     this.id,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });
//   @override
//   // TODO: implement props
//   List<Object?> get props {
//     return [id, title, description, url, urlToImage, publishedAt, content];
//   }
// }

class NoteEntity extends Equatable {
  const NoteEntity({this.id, this.noteTitle, this.noteContent, this.addTime});
  final int? id;
  final String? noteTitle;
  final String? noteContent;
  final int? addTime;
  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, noteTitle, noteContent, addTime];
  }
}
