import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/enitites/not_entity.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/add_note_usecase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/delete_note_usecase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/get_notes_usescaase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/domain/usecases/update_note_usecase.dart';
import 'package:clean_architecture_using_bloc/feaucture/notes_app/presentation/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bloc_event.dart';

class Blocs extends Bloc<BlocEvent, BlocState> {
  final AddNoteUsesCase addNoteUsesCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final UpdaeNoteUseCases updateNoteUseCases; // تم تصحيح الخطأ الإملائي هنا
  final GetNotesUseseCase getNotesUseseCase;

  Blocs({
    required this.getNotesUseseCase,
    required this.updateNoteUseCases,
    required this.deleteNoteUseCase,
    required this.addNoteUsesCase,
  }) : super(NoteInitional()) {
    on<AddNoteEvent>(_onAddNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
    on<GetAllNotesEvent>(_onGetAllNotesEvent);
  }
  //   Future to Add new note
  Future<void> _onAddNoteEvent(
    AddNoteEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(NoteLoading());
    try {
      final int timestamp = DateTime.now().millisecondsSinceEpoch;
      final NoteEntity newNote = NoteEntity(
        noteTitle: event.noteTitle,
        noteContent: event.noteContent,
        addTime: timestamp,
      );
      await addNoteUsesCase.call(newNote);
      // to get all notes after adding a new note
      add(GetAllNotesEvent());
    } catch (e) {
      emit(NoteError(message: "فشل في اضافة الملاحضة$e"));
    }
  }

  //   Future to Add new note
  Future<void> _onDeleteNoteEvent(
    DeleteNoteEvent event,
    Emitter<BlocState> emit,
  ) async {
    await deleteNoteUseCase.call(event.noteID);
    // to get all notes after adding a new note
    add(GetAllNotesEvent());
  }

  Future<void> _onGetAllNotesEvent(
    GetAllNotesEvent event,
    Emitter<BlocState> emit,
  ) async {
    //  make loading whin open the app
    emit(NoteLoading());
    try {
      final notes = await getNotesUseseCase.call();
      //  get the notes if no Error
      emit(NoteLoaded(notes: notes));
    } catch (e) {
      // if get an Error when fach data from database
      emit(NoteError(message: 'خطاء في جلب البيانات'));
    }
  }
}
