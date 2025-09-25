// import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  TextEditingController noteTitle = TextEditingController();
  TextEditingController noteContent = TextEditingController();
  // final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          child: MaterialButton(
            onPressed: () {
              TextStyle(color: Colors.blue);
            },
            child: Text('data'),
          ),
          // onTap: () {
          //   Center(
          //     child: TextFormField(
          //       decoration: InputDecoration(enabled: true, filled: true),
          //     ),
          //   );
          // },
        ),
      ),

      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: noteTitle,
            decoration: InputDecoration(
              filled: true,
              label: Text('Enter the Note name'),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: noteContent,
            decoration: InputDecoration(
              filled: true,
              label: Text('Enter the Note name'),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // int? mm = int.tryParse(noteName.text);
              final title = noteTitle.text;
              final content = noteContent.text;
              if (title.isNotEmpty & content.isNotEmpty) {
                BlocProvider.of<Blocs>(
                  context,
                ).add(AddNoteEvent(noteTitle: title, noteContent: content));
                print('the $title note add');
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('الرجاء ادخال العنوان والمحتوى')),
                );
              }
            },
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}
