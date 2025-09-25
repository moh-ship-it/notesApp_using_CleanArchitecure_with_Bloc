// lib/feaucture/notes_app/presentation/widgets/add_note_form.dart

import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc.dart';
// import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';

// import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_event.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/cubit/add_note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({super.key});

  // هذه الدالة ستعرض القائمة السفلية
  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            children: [
              Text('المجلدات', style: TextStyle(fontSize: 18)),
              ListTile(leading: Icon(Icons.folder), title: Text('My Folder')),
              ListTile(leading: Icon(Icons.star), title: Text('Favorite')),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // الوصول إلى Cubit
    final cubit = context.read<AddNoteCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // قم بتغليف حقل العنوان بـ GestureDetector
          GestureDetector(
            onTap: () {
              // إخفاء لوحة المفاتيح
              FocusScope.of(context).unfocus();
              // عرض القائمة السفلية
              _showOptionsBottomSheet(context);
            },
            child: AbsorbPointer(
              // يمنع حقل النص من تلقي النقر وفتح لوحة المفاتيح مباشرة
              absorbing: true,
              child: TextField(
                controller: cubit.titleController,
                decoration: const InputDecoration(
                  labelText: 'Note Title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: cubit.contentController,
            decoration: const InputDecoration(
              labelText: 'Note Content',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              final String title = cubit.titleController.text;
              final String content = cubit.contentController.text;

              if (title.isNotEmpty && content.isNotEmpty) {
                // إرسال الحدث إلى الـ Bloc الرئيسي
                context.read<Blocs>().add(
                  AddNoteEvent(noteTitle: title, noteContent: content),
                );
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a title and content'),
                  ),
                );
              }
            },
            child: const Text('Save Note'),
          ),
        ],
      ),
    );
  }
}
