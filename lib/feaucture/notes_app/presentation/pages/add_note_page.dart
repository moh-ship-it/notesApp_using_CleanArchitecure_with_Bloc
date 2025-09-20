// lib/feaucture/notes_app/presentation/pages/add_note_page.dart

import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc.dart';
// import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _titleFocusNode =
      FocusNode(); // لإدارة التركيز على حقل العنوان

  @override
  void initState() {
    super.initState();
    // عند أول دخول للصفحة، اجعل حقل العنوان يركز تلقائيًا ليظهر المؤشر
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // وضع TextField مباشرة في عنوان الـ AppBar
        title: TextField(
          controller: _titleController,
          focusNode: _titleFocusNode, // ربط FocusNode بالـ TextField
          decoration: const InputDecoration(
            hintText: 'العنوان', // يظهر هذا النص عند الفراغ
            border: InputBorder.none, // لإزالة الحدود
            isDense: true, // لتقليل الارتفاع الافتراضي
            contentPadding: EdgeInsets.zero, // لإزالة أي مسافات داخلية
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // أو اللون المناسب للـ AppBar
          ),
          textAlign: TextAlign.right, // لمحاذاة النص لليمين
          onTap: () {
            // عند النقر على العنوان، إذا كان فارغاً، اجعله يحمل قيمة "العنوان"
            if (_titleController.text.isEmpty) {
              _titleController.text = 'العنوان';
            }
          },
        ),
      ),
      body: Column(
        // نستخدم Column في الـ body لعرض العناصر بشكل عمودي
        crossAxisAlignment:
            CrossAxisAlignment.end, // لمحاذاة العناصر إلى اليمين
        children: [
          // الصف الذي يحتوي على كلمة "المجلدات" والأيقونات
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // لمحاذاة العناصر إلى اليمين
              children: [
                IconButton(
                  icon: const Icon(Icons.folder_outlined),
                  onPressed: () {
                    // كود عند الضغط على أيقونة المجلدات
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {
                    // كود عند الضغط على أيقونة النجمة
                  },
                ),
                const SizedBox(width: 8),
                const Text('المجلدات', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          const SizedBox(height: 16.0),

          // حقل محتوى الملاحظة
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'محتوى الملاحظة',
                  border: InputBorder.none, // لإزالة الحدود
                ),
                maxLines: null, // يسمح بعدة أسطر
                textAlign: TextAlign.right, // لمحاذاة النص لليمين
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final String title = _titleController.text;
                final String content = _contentController.text;
                if (title.isNotEmpty && content.isNotEmpty) {
                  BlocProvider.of<Blocs>(
                    context,
                  ).add(AddNoteEvent(noteTitle: title, noteContent: content));
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
          ),
        ],
      ),
    );
  }
}
