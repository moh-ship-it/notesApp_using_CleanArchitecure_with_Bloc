import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
// import '../widgets/buildgrid_Items.dart';
import '../widgets/sliver_gird.dart';
import '../widgets/sliverappbar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<Blocs>(context).add(GetAllNotesEvent());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('addnote');
        },
        child: Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      // key: scaffoldKey,
      endDrawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          Sliverappbar(),
          BlocBuilder<Blocs, BlocState>(
            builder: (context, state) {
              if (state is NoteLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is NoteLoaded) {
                final notes = state.notes;
                // قم بتمرير قائمة الملاحظات إلى SliverGred
                return SliverGred(note: notes);
              } else if (state is NoteError) {
                return SliverFillRemaining(
                  child: Center(child: Text(state.message)),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(child: Text('Press a button to load notes')),
                );
              }
            },
          ),
        ],
      ),

      // CustomScrollView(
      //       slivers: [
      //         Sliverappbar(),
      //         SliverPadding(
      //           padding: EdgeInsets.all(16.0),
      //           sliver: BuildgridItems(),
      //         ),
      //       ],
      //     ),
    );
  }
}
