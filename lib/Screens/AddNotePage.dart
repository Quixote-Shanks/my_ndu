import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Notes/notes_bloc.dart';
import '../Widgets/SelectedColor.dart';
import '../Widgets/TextFieldBody.dart';
import '../Widgets/TextFieldTitle.dart';
import '../Widgets/TextFrave.dart';
import '../helpers/modalSelectCategory.dart';
import '../helpers/modal_warning.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _noteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clearText();
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void clearText() {
    _titleController.clear();
    _noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F3F7),
        elevation: 0,
        title: const TextFrave(
            text: 'Add Note',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            isTitle: true),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Center(
                child: TextFrave(
              text: 'Cancel',
              fontSize: 15,
              color: Color(0xff0C6CF2),
            ))),
        actions: [
          InkWell(
            onTap: () {
              if (_titleController.text.trim().isNotEmpty &&
                  _noteController.text.trim().isNotEmpty) {
                noteBloc.add(AddNoteFrave(
                    title: _titleController.text,
                    body: _noteController.text,
                    created: DateTime.now(),
                    color: noteBloc.state.color,
                    isComplete: false,
                    category: noteBloc.state.category));
                clearText();
                Navigator.pop(context);
              } else {
                modalWarning(context, 'Title and note is required');
              }
            },
            child: Container(
                alignment: Alignment.center,
                width: 60,
                child: const TextFrave(
                    text: 'Save', fontSize: 15, color: Color(0xff0C6CF2))),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TextTitle(
                  controller: _titleController,
                ),
                const SizedBox(height: 20.0),
                TextWriteNote(controller: _noteController),
                const SizedBox(height: 20.0),
                _Category(),
                const SizedBox(height: 30.0),
                SelectedColors(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: const Color(0xffF6F8F9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: TextFrave(text: 'Category'),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            alignment: Alignment.center,
            height: 40,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  const BoxShadow(
                      color: Colors.grey, blurRadius: 7, spreadRadius: -5.0)
                ]),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () => showDialogBottomFrave(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<NotesBloc, NotesState>(
                      builder: (_, state) => Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: state.colorCategory, width: 4.0),
                            borderRadius: BorderRadius.circular(7.0)),
                      ),
                    ),
                    BlocBuilder<NotesBloc, NotesState>(
                        builder: (_, state) => TextFrave(
                            text: state.category, fontWeight: FontWeight.w600)),
                    const Icon(Icons.expand_more)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
