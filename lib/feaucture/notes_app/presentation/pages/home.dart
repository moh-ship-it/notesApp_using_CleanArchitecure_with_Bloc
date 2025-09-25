import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
// import '../widgets/buildgrid_Items.dart';
import '../widgets/sliver_gird.dart';
import '../widgets/sliverappbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      endDrawer: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Drawer(
          child: ListView(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                alignment: Alignment.topLeft,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Text('كل الملاحظات', textAlign: TextAlign.end),
                      trailing: Icon(Icons.event_note),
                    ),
                    ListTile(
                      title: Text(' المفضله', textAlign: TextAlign.end),
                      trailing: Icon(Icons.star_outline_sharp),
                    ),
                    ListTile(
                      title: Text(
                        'الملاحظات التي تمت مشاركتها ',
                        textAlign: TextAlign.end,
                      ),
                      trailing: Icon(Icons.people_outline),
                    ),
                    ListTile(
                      title: Text(' سلة المحذوفات', textAlign: TextAlign.end),
                      trailing: Icon(Icons.delete_forever_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(' المجلدات', textAlign: TextAlign.end),
                      trailing: Icon(Icons.folder_outlined),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},

                        child: Text('ادارة المجلدات'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.white,
        onRefresh: () async {
          return BlocProvider.of<Blocs>(context).add(GetAllNotesEvent());
        },
        // notificationPredicate: (ScrollNotification notification) {
        //   return notification.depth == 1;
        // },
        child: CustomScrollView(
          slivers: [
            Sliverappbar(),

            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  width: 400,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    // color: Colors.red,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: ListTile(
                            title: Text(
                              'للحصول على ملاحظاتك على اي جهاز ',
                              textAlign: TextAlign.end,
                            ),
                            subtitle: Text(
                              '''
                                قم بالمزامنة معMecrosoft OneNote مشاهدتها في تطبيقات مثل Outlook  و OneNote على الويب
                             ''',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            OverflowBar(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(' جربة'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(' ليس الان'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                  return SliverFillRemaining(
                    child: Center(child: Text('Press a button to load notes')),
                  );
                }
              },
            ),
          ],
        ),
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
