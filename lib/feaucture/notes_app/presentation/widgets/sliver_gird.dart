import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/widgets/buildgrid_Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/bloc.dart';

// import '../bloc/bloc.dart';

class SliverGred extends StatelessWidget {
  final List<NoteEntity> note;
  SliverGred({super.key, required this.note});
  // final Blocs bloc = Blo cs();
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final notes = note[index];

          return BuildgridItems(note: notes);
        }, childCount: note.length),
      ),
    );
  }
}
