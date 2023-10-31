import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_ndu/apis/models/entities/subject.dart';
import 'package:my_ndu/apis/models/entities/subject_assignment.dart';
import 'package:my_ndu/apis/models/entities/subject_stream.dart';
import 'package:my_ndu/modules/classroom/controllers/subject_controller.dart';
import '../../ui/theme/app_color.dart';
import '../../ui/widgets/app_icon_buttton.dart';
import '../../ui/widgets/assignment_highlight.dart';
import '../../ui/widgets/assignment_item.dart';
import '../../ui/widgets/stream_item.dart';
import '../../ui/widgets/student_item.dart';
import '../../ui/widgets/subject_post.dart';

class SubjectView extends StatefulWidget {
  final Subject subject;

  const SubjectView({Key? key, required this.subject}) : super(key: key);

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    
final _controller = Get.find<SubjectController>();
_controller.fetchSubjectDetails();
_controller.fetchStreams();
_controller.fetchAssignments();

final subjectStreams = _controller.streams.where((item) => item.subjectId == widget.subject.id).toList();
    final menus = <Map<String, dynamic>>[
      {'index': 1, 'icon': Icons.timer, 'title': "Stream"},
      {'index': 2, 'icon': Icons.assignment, 'title': "Assignment"},
      {'index': 3, 'icon': Icons.group, 'title': "Classmates"},
    ];
    final bodies = <Widget>[
      StreamBody(streams: subjectStreams),
      AssignmentBody(
          assignments: _controller.assignments.where((item) => item.subjectId == widget.subject.id).toList()),
     ClassmateBody()
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  AppIconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/back.svg",
                      width: 24,
                      height: 24,
                      color: AppColor.white,
                    ),
                    onTap: () {
                      // Navigate back
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.subject.name,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.subject.desc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColor.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppIconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/gmeet.svg",
                          width: 24,
                          height: 24,
                          color: AppColor.white,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      AppIconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/info.svg",
                          width: 24,
                          height: 24,
                          color: AppColor.white,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Assignment highlight
              Row(
                children: _controller.assignments
                    .where((item) => item.subjectId == widget.subject.id)
                    .take(2)
                    .map(
                      (item) => Expanded(
                        child: AssignmentHighlight(
                          assignment: item,
                          onTap: (item) {},
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),
              // Menu
              GNav(
                selectedIndex: _activeIndex,
                curve: Curves.easeInOutQuint,
                duration: const Duration(milliseconds: 300),
                haptic: true,
                gap: 8,
                tabMargin: const EdgeInsets.symmetric(horizontal: 8),
                color: AppColor.grey,
                activeColor: Theme.of(context).primaryColor,
                tabBackgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.25),
                onTabChange: (index) {
                  setState(() {
                    _activeIndex = index;

                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  });
                },
                tabs: menus
                    .map(
                      (menu) => GButton(
                        gap: 8,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        icon: menu['icon'],
                        text: menu['title'],
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Post
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemCount: bodies.length,
                  itemBuilder: (ctx, index) => bodies[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamBody extends StatelessWidget {
  final List<SubjectStream> streams;

  const StreamBody({Key? key, required this.streams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectPost(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: streams.length,
            itemBuilder: (ctx, index) {
              final stream = streams[index];
              // Stream item
              return StreamItem(stream: stream);
            },
          ),
        ),
      ],
    );
  }
}

class AssignmentBody extends StatelessWidget {
  final List<SubjectAssignment> assignments;

  const AssignmentBody({Key? key, required this.assignments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectPost(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: assignments.length,
            itemBuilder: (ctx, index) {
              final assignment = assignments[index];

              return AssignmentItem(
                assignment: assignment,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ClassmateBody extends StatelessWidget {
  final SubjectController _controller = Get.find<SubjectController>();
  ClassmateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _controller.students.length,
            itemBuilder: (ctx, index) {
              final student = _controller.students[index];

              return StudentItem(student: student);
            },
          ),
        ),
      ],
    );
  }
}
