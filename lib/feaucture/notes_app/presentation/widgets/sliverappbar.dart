import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/contents/contents.dart';
import '../pages/home.dart';

class Sliverappbar extends StatelessWidget {
  Sliverappbar({super.key});
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String? value;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 200,
      toolbarHeight: 80,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              return Row(
                children: [
                  PopupMenuButton(
                    enabled: true,
                    onSelected: (String value) {
                      value = value;
                    },

                    itemBuilder: (context) {
                      return popupMenuButton_Items
                          .map(
                            (String choice) => PopupMenuItem(
                              value: choice,
                              child: Text('$choice'),
                            ),
                          )
                          .toList();
                    },
                  ),
                  // Icon(Icons.more_vert),
                  SizedBox(width: 10),
                  Icon(Icons.search),
                  SizedBox(width: 20.0),
                  Icon(Icons.picture_as_pdf_outlined),
                  SizedBox(width: 180),
                  Text('data'),
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(Icons.drag_handle_sharp),
                  ),
                ],
              );
            },
          ),
        ),

        background: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [Text('كل ملاحضاتك'), Text(' عدد الملاحظات}')],
          ),
        ),
        centerTitle: true,
      ),

      actions: [Spacer()],
    );
  }
}
