import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../Bloc/Notes/notes_bloc.dart';
import '../Bloc/general/general_bloc.dart';
import '../Models/NoteModels.dart';
import '../Widgets/TextFrave.dart';
import 'AddNotePage.dart';
import 'ShowNotePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  List<String> itemDropDown = ['Edit', 'View', 'Pin favorite'];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerApp);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_scrollControllerApp);
    super.dispose();
  }

  void _scrollControllerApp() {
    if (_scrollController.offset > 170) {
      BlocProvider.of<GeneralBloc>(context).add(const IsScrollTopAppBarEvent(true));
    } else {
      BlocProvider.of<GeneralBloc>(context).add(const IsScrollTopAppBarEvent(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    final box = Hive.box<NoteModels>('keepNote');

    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            BlocBuilder<GeneralBloc, GeneralState>(
              builder: (context, state) => SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: state.isScrollAppBar ? 1 : 0,
                      child: const TextFrave(
                          text: 'All notes',
                          isTitle: true,
                          fontSize: 20,
                          color: Colors.black)),
                  background: Container(
                    color: const Color(0xffF2F3F7),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: !state.isScrollAppBar ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextFrave(
                            text: 'All notes',
                            isTitle: true,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                          BlocBuilder<NotesBloc, NotesState>(
                            builder: (context, state) => TextFrave(
                              text: '${state.noteLength} notes',
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height * .4,
                pinned: true,
                elevation: 0,
                backgroundColor: const Color(0xffF2F3F7),
                leading: IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: const Icon(Icons.menu_rounded, color: Colors.black),
                ),
                actions: [
                  BlocBuilder<NotesBloc, NotesState>(
                    builder: (context, state) => IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        noteBloc.add(ChangedListToGrid(!state.isList));
                      },
                      icon: Icon(
                          state.isList
                              ? Icons.view_agenda_outlined
                              : Icons.grid_view_rounded,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (_, Box box, __) {
                  noteBloc.add(LengthAllNotesEvent(box.length));

                  if (box.values.isEmpty) {
                    return const Center(
                      child: TextFrave(text: 'No notes', color: Colors.grey),
                    );
                  }

                  return BlocBuilder<NotesBloc, NotesState>(
                      builder: (_, state) {
                    return state.isList
                        ? Column(
                            children: [
                              const _ListNotes(),
                              state.noteLength == 5
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                    )
                                  : const SizedBox()
                            ],
                          )
                        : const _GridViewNote();
                  });
                },
              ),
            ]))
          ],
        ),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddNotePage())),
        child: const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff1977F3),
          child: Icon(Icons.mode_edit_outline, color: Colors.white),
        ),
      ),
    );
  }
}

class _ListNotes extends StatelessWidget {
  const _ListNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    final box = Hive.box<NoteModels>('keepNote');

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: box.values.length,
      itemBuilder: (_, i) {
        var note = box.getAt(i)!;

        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ShowNotePage(note: note, index: i))),
          child: Dismissible(
            key: Key(note.title!),
            background: Container(),
            direction: DismissDirection.endToStart,
            secondaryBackground: Container(
              padding: const EdgeInsets.only(right: 35.0),
              margin: const EdgeInsets.only(bottom: 15.0),
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: const Icon(Icons.delete_sweep_rounded,
                  color: Colors.white, size: 40),
            ),
            onDismissed: (direction) => noteBloc.add(DeleteNoteEvent(i)),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(bottom: 15.0),
              height: 110,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFrave(
                          text: note.title.toString(),
                          fontWeight: FontWeight.w600),
                      TextFrave(
                          text: note.category!,
                          fontSize: 16,
                          color: Colors.blueGrey),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Wrap(
                    children: [
                      TextFrave(
                        text: note.body.toString(),
                        fontSize: 16,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFrave(
                          text: timeago.format(note.created!),
                          fontSize: 16,
                          color: Colors.grey),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.circle,
                              color: Color(note.color!), size: 15)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GridViewNote extends StatelessWidget {
  const _GridViewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    final box = Hive.box<NoteModels>('keepNote');

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 200,
            mainAxisExtent: 250),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: box.values.length,
        itemBuilder: (_, i) {
          var note = box.getAt(i)!;

          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ShowNotePage(note: note, index: i))),
            child: Dismissible(
              key: Key(note.title!),
              direction: DismissDirection.endToStart,
              background: Container(),
              secondaryBackground: Container(
                padding: const EdgeInsets.only(bottom: 35.0),
                margin: const EdgeInsets.only(bottom: 15.0),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: const Icon(Icons.delete, color: Colors.white, size: 40),
              ),
              onDismissed: (direction) => noteBloc.add(DeleteNoteEvent(i)),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: TextFrave(
                            text: note.title.toString(),
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: Container(
                          child: TextFrave(
                        text: note.body.toString(),
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFrave(
                            text: timeago.format(note.created!),
                            fontSize: 16,
                            color: Colors.grey),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.circle,
                                color: Color(note.color!), size: 15)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
