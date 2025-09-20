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
    // final noteBloc = BlocProvider.of<Blocs>(context);
    // final v = BlocProvider.of<Blocs>(context).add(GetAllNotesEvent());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
