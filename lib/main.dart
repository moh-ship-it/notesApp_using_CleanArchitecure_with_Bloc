import 'package:clean_architecture_using_bloc/feaucture/notes_app/data/repositories/note_repository_impl.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/add_note_usecase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/delete_note_usecase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/get_notes_usescaase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/update_note_usecase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/thems/app_thems.dart';
import 'feaucture/notes_app/data/data_source/local/database_helper.dart';
import 'feaucture/notes_app/presentation/bloc/bloc.dart';
import 'feaucture/notes_app/presentation/pages/add_note.dart';
import 'feaucture/notes_app/presentation/pages/add_note_page.dart';
import 'feaucture/notes_app/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDataSource = DatabesHelper();
  //  تمرير Data Source إلى Repository
  final repository = NoteRepositoryImpl(localDataSource);
  final addNote = AddNoteUsesCase(repository);
  final deleteNote = DeleteNoteUseCase(repository);
  final updateNote = UpdaeNoteUseCases(repository);
  final getNotes = GetNotesUseseCase(repository);
  runApp(
    BlocProvider(
      create: (context) => Blocs(
        addNoteUsesCase: addNote,
        deleteNoteUseCase: deleteNote,
        updateNoteUseCases: updateNote,
        getNotesUseseCase: getNotes,
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,

      title: 'Flutter Demo',
      home: Home(),
      routes: {'addnote': (context) => AddNotePage()},
    );
  }
}
