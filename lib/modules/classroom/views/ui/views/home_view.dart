import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/modules/classroom/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../theme/app_color.dart';
import '../views/subject_view.dart';
import '../widgets/app_icon_buttton.dart';
import '../widgets/assignment_week.dart';
import '../widgets/subject_item.dart';
import 'calendar.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBarModalBottomSheet(
              context: context,
              animationCurve: Curves.easeInOut,
              backgroundColor: Theme.of(context).canvasColor,
              bounce: true,
              enableDrag: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              builder: (ctx) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Join Class",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your class code",
                          hintStyle: TextStyle(
                            color: AppColor.grey.withOpacity(
                              0.75,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColor.dark,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Do something & close modal
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                          child: const Text(
                            "Join Class",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          splashColor: AppColor.black.withOpacity(0.35),
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/schedule.svg",
                      width: 24,
                      height: 24,
                      color: AppColor.white,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassroomCalendarScreen(),
                        ),
                      );
                    },
                  ),
                  AppIconButton(
                    icon: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/notification-fill.svg",
                          width: 24,
                          height: 24,
                          color: AppColor.white,
                        ),
                        Positioned(
                          right: 2,
                          top: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border.all(
                                color: Theme.of(context).canvasColor,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(360),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.asset(
                      "assets/images/user.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColor.white,
                      ),
                      children: [
                        TextSpan(
                          text: "Morning ",
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: "Eko ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "👋🏼",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      "Never underestimate yourself, you've come this far",
                      style: TextStyle(
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "This week",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(360),
                        splashColor:
                            Theme.of(context).primaryColor.withOpacity(0.25),
                        highlightColor:
                            Theme.of(context).primaryColor.withOpacity(0.4),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "View all",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return AssignmentWeek(
                            count: _controller.weeklyAssigned['count'],
                            subjects: _controller.weeklyAssigned['subjects'],
                            type: AssignmentType.assigned,
                          );
                        }),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Obx(() {
                          return AssignmentWeek(
                            count: _controller.weeklyMissed['count'],
                            subjects: _controller.weeklyMissed['subjects'],
                            type: AssignmentType.missed,
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.subjects.length,
                  itemBuilder: (ctx, index) {
                    final subject = _controller.subjects[index];

                    // Subject Item
                    return GestureDetector(
                      onTap: () {
                        // Navigate to subject view
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SubjectView(subject: subject),
                          ),
                        );
                      },
                      child: SubjectItem(subject: subject),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
