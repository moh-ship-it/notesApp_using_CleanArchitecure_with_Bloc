import 'package:flutter/material.dart';

import '../pages/home.dart';

class Sliverappbar extends StatelessWidget {
  Sliverappbar({super.key});
  Home home = Home();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
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
                  Icon(Icons.more_vert),
                  SizedBox(width: 10),
                  Icon(Icons.search),
                  SizedBox(width: 20.0),
                  Icon(Icons.picture_as_pdf_outlined),
                  SizedBox(width: 200),
                  Text('data'),
                  IconButton(
                    onPressed: () {
                      home.scaffoldKey.currentState!.openEndDrawer();
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
            children: [Text('كل ملاحضاتك'), Text('عدد الملاحظات')],
          ),
        ),
        centerTitle: true,
      ),

      actions: [Spacer()],
    );
  }
}
