// lib/feaucture/notes_app/presentation/cubit/add_note_cubit.dart
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteCubit extends Cubit<void> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();

  AddNoteCubit() : super(null);

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    titleFocusNode.dispose();
    return super.close();
  }
}
