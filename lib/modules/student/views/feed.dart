import 'package:flutter/material.dart';

class PostTopic extends StatefulWidget {
  const PostTopic({Key? key}) : super(key: key);

  @override
  _PostTopicState createState() => _PostTopicState();
}

class _PostTopicState extends State<PostTopic> {
  List<Topic> _topics = []; // List of topics
  int _expandedIndex = -1; // Index of the currently expanded topic, -1 for none

  void _createTopic(String title, String description, List<String> tags) {
    // Create a new topic and add it to the list
    setState(() {
      _topics.add(Topic(
        title: title,
        description: description,
        tags: tags,
        author: 'John Doe', // Replace with actual user information
        timestamp: DateTime.now(), // Replace with actual timestamp
        comments: [],
        upvotes: 0,
        downvotes: 0,
      ));
    });
  }

  void _commentOnTopic(int index, String comment) {
    // Add a comment to the specified topic
    setState(() {
      _topics[index].comments.add(Comment(
        author: 'John Doe', // Replace with actual user information
        timestamp: DateTime.now(), // Replace with actual timestamp
        text: comment,
        replies: [],
        upvotes: 0,
        downvotes: 0,
      ));
    });
  }

  void _replyToComment(int topicIndex, int commentIndex, String reply) {
    // Add a reply to the specified comment
    setState(() {
      _topics[topicIndex].comments[commentIndex].replies.add(Comment(
        author: 'John Doe', // Replace with actual user information
        timestamp: DateTime.now(), // Replace with actual timestamp
        text: reply,
        replies: [],
        upvotes: 0,
        downvotes: 0,
      ));
    });
  }

  void _upvoteTopic(int index) {
    // Increment the upvotes of the specified topic
    setState(() {
      _topics[index].upvotes++;
    });
  }

  void _downvoteTopic(int index) {
    // Increment the downvotes of the specified topic
    setState(() {
      _topics[index].downvotes++;
    });
  }

  void _upvoteComment(int topicIndex, int commentIndex) {
    // Increment the upvotes of the specified comment
    setState(() {
      _topics[topicIndex].comments[commentIndex].upvotes++;
    });
  }

  void _downvoteComment(int topicIndex, int commentIndex) {
    // Increment the downvotes of the specified comment
    setState(() {
      _topics[topicIndex].comments[commentIndex].downvotes++;
    });
  }

  void _upvoteReply(int topicIndex, int commentIndex, int replyIndex) {
    // Increment the upvotes of the specified reply
    setState(() {
      _topics[topicIndex].comments[commentIndex].replies[replyIndex].upvotes++;
    });
  }

  void _downvoteReply(int topicIndex, int commentIndex, int replyIndex) {
    // Increment the downvotes of the specified reply
    setState(() {
      _topics[topicIndex].comments[commentIndex].replies[replyIndex].downvotes++;
    });
  }

  void _toggleExpansion(int index) {
    // Toggle the expansion state of the topic
    setState(() {
      _expandedIndex = (_expandedIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Topic'),
      ),
      body: ListView.builder(
        itemCount: _topics.length,
        itemBuilder: (context, index) {
          final topic = _topics[index];
          final isExpanded = _expandedIndex == index;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 24.0,
                        child: Text(
                          topic.author[0],
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topic.author,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              topic.timestamp.toString(),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _toggleExpansion(index),
                        child: Text(
                          topic.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        topic.description,
                        maxLines: isExpanded ? null : 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: topic.tags.map((tag) {
                          return Chip(
                            label: Text(
                              tag,
                              style: TextStyle(fontSize: 12.0),
                            ),
                            backgroundColor: Colors.grey[300],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8.0)),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Comments (${topic.comments.length})',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: topic.comments.length,
                          itemBuilder: (context, commentIndex) {
                            final comment = topic.comments[commentIndex];
                            return CommentWidget(
                              comment: comment,
                              onReply: (reply) =>
                                  _replyToComment(index, commentIndex, reply),
                              onUpvote: () =>
                                  _upvoteComment(index, commentIndex),
                              onDownvote: () =>
                                  _downvoteComment(index, commentIndex),
                              onUpvoteReply: (replyIndex) =>
                                  _upvoteReply(index, commentIndex, replyIndex),
                              onDownvoteReply: (replyIndex) =>
                                  _downvoteReply(index, commentIndex, replyIndex),
                            );
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Add a comment...',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                // Perform comment validation and add the comment
                                final comment = 'New Comment'; // Replace with the actual comment
                                _commentOnTopic(index, comment);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_upward),
                        onPressed: () => _upvoteTopic(index),
                      ),
                      Text('${topic.upvotes}'),
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () => _downvoteTopic(index),
                      ),
                      Text('${topic.downvotes}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform topic creation logic and show a dialog or navigate to a new page for topic creation
          final title = 'New Topic'; // Replace with the actual title
          final description = 'Topic description'; // Replace with the actual description
          final tags = ['tag1', 'tag2', 'tag3']; // Replace with the actual tags
          _createTopic(title, description, tags);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Topic {
  final String title;
  final String description;
  final List<String> tags;
  final String author;
  final DateTime timestamp;
  final List<Comment> comments;
  int upvotes;
  int downvotes;

  Topic({
    required this.title,
    required this.description,
    required this.tags,
    required this.author,
    required this.timestamp,
    required this.comments,
    this.upvotes = 0,
    this.downvotes = 0,
  });
}

class Comment {
  final String author;
  final DateTime timestamp;
  final String text;
  final List<Comment> replies;
  int upvotes;
  int downvotes;

  Comment({
    required this.author,
    required this.timestamp,
    required this.text,
    required this.replies,
    this.upvotes = 0,
    this.downvotes = 0,
  });
}

class CommentWidget extends StatelessWidget {
  final Comment comment;
  final void Function(String) onReply;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;
  final void Function(int) onUpvoteReply;
  final void Function(int) onDownvoteReply;

  const CommentWidget({
    required this.comment,
    required this.onReply,
    required this.onUpvote,
    required this.onDownvote,
    required this.onUpvoteReply,
    required this.onDownvoteReply,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 16.0,
              child: Text(
                comment.author[0],
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    comment.timestamp.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Text(
          comment.text,
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: onUpvote,
            ),
            Text('${comment.upvotes}'),
            IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: onDownvote,
            ),
            Text('${comment.downvotes}'),
            IconButton(
              icon: Icon(Icons.reply),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Reply to Comment'),
                      content: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your reply...',
                        ),
                        onChanged: onReply,
                      ),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: Text('Reply'),
                          onPressed: () {
                            // Perform reply validation and add the reply
                            final reply = 'New Reply'; // Replace with the actual reply
                            onReply(reply);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: comment.replies.length,
          itemBuilder: (context, replyIndex) {
            final reply = comment.replies[replyIndex];
            return Container(
              margin: EdgeInsets.only(left: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 12.0,
                        child: Text(
                          reply.author[0],
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reply.author,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              reply.timestamp.toString(),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 8.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    reply.text,
                    style: TextStyle(fontSize: 10.0),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_upward),
                        onPressed: () => onUpvoteReply(replyIndex),
                      ),
                      Text('${reply.upvotes}'),
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () => onDownvoteReply(replyIndex),
                      ),
                      Text('${reply.downvotes}'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

