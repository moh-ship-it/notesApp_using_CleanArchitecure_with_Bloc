import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/enitites/not_entity.dart';
import '../bloc/bloc.dart';

class BuildgridItems extends StatelessWidget {
  const BuildgridItems({super.key, required this.note});
  final NoteEntity note;
  @override
  Widget build(BuildContext context) {
    // تحويل الـ Unix Timestamp إلى DateTime
    final date = DateTime.fromMillisecondsSinceEpoch(note.addTime ?? 0);
    // تنسيق التاريخ إلى نص مقروء
    final formattedDate = DateFormat('dd MMM, yyyy - hh:mm a').format(date);

    return Container(
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
    );
  }
}
