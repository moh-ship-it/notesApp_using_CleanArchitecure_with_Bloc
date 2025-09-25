// import 'dart:js_interop';
// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:alert_dialog/alert_dialog.dart';
// import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:intl/intl.dart';

import '../../domain/enitites/not_entity.dart';
import '../bloc/bloc.dart';
// import '../bloc/bloc.dart';

class BuildgridItems extends StatelessWidget {
  const BuildgridItems({super.key, required this.note});
  final NoteEntity note;

  // const Future<void> dd(id)async{
  // BlocProvider.of<Blocs>(
  // context,
  // ).add(DeleteNoteEvent(noteID: co));
  // }
  @override
  Widget build(BuildContext context) {
    // تحويل الـ Unix Timestamp إلى DateTime
    final date = DateTime.fromMillisecondsSinceEpoch(note.addTime ?? 0);
    // تنسيق التاريخ إلى نص مقروء
    final formattedDate = DateFormat('dd MMM, yyyy - hh:mm a').format(date);

    return InkWell(
      onLongPress: () async {
        alert(
          context,
          title: Text('what do you want'),
          content: Column(
            children: [
              TextButton(
                onPressed: () {
                  alert(
                    context,
                    title: Icon(Icons.warning_amber),
                    content: Text('Are you sure you want to delete'),
                    textOK: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            BlocProvider.of<Blocs>(
                              context,
                            ).add(DeleteNoteEvent(noteID: note.id ?? 0));
                            Navigator.of(context).pop();
                          },

                          child: Text('yes'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Delete'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('addnote');
                },
                child: Text('Update'),
              ),
            ],
          ),
          textOK: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: Text('Cancel'),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          // color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.1,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                // child: Image.asset("${}", fit: BoxFit.cover),
                child: Text('${note.noteContent}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${note.noteTitle}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${formattedDate}',
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
