import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/modules/discussion/controllers/discussion_controller.dart';

class DiscussionView extends StatelessWidget {
  final DiscussionController _controller = Get.find<DiscussionController>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion'),
      ),
      body: Obx(
        () => _controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _controller.discussionData.discussions.length,
                itemBuilder: (context, index) {
                  final discussion = _controller.discussionData.discussions[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        discussion.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            discussion.category,
                            style: TextStyle(fontSize: 14),
                          ),
                          // Add more details from the discussion object if needed.
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // Handle discussion tap
                        // TODO: Navigate to the discussion details page
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateDiscussionDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showCreateDiscussionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Discussion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty && _categoryController.text.isNotEmpty) {
                  _createDiscussion();
                  Navigator.of(context).pop();
                } else {
                  // TODO: Show an error message indicating that the fields are required.
                }
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _createDiscussion() {
  _controller.createDiscussion(
    title: _titleController.text,
    category: _categoryController.text,
    tags: [], // Empty list as a default value
    participants: [], // Empty list as a default value
  );
}

}
