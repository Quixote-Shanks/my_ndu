import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.screenTitles[controller.selectedIndex.value])),
      ),
      body: Obx(
        () => ReorderableListView.builder(
          itemCount: controller.screens.length,
          itemBuilder: (context, index) => Card(
            key: ValueKey(index),
            child: ListTile(
              leading: Icon(Icons.drag_handle),
              title: Text(controller.screenTitles[index]),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => controller.hideElement(index),
              ),
            ),
          ),
          onReorder: (oldIndex, newIndex) => controller.rearrangeSections(oldIndex, newIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.selectScreen,
          items: [
            for (int i = 0; i < controller.screenTitles.length; i++)
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: controller.screenTitles[i],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Open a dialog to select a widget to add
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Widget'),
              content: Column(
                children: [
                  Text('Select a widget to add:'),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.availableWidgets.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(controller.availableWidgets[index].title),
                      onTap: () {
                        // Add the selected widget
                        controller.addWidget(controller.availableWidgets[index].widget);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
