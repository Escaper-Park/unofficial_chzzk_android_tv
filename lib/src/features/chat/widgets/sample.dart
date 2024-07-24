import 'package:flutter/material.dart';

// TODO :

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [];

    return ListView.builder(
      // Don't save previous chats to memory for performance.
      addAutomaticKeepAlives: false,
      // Set this false for performance.
      addRepaintBoundaries: false,
      // Don't use.
      addSemanticIndexes: false,
      // Set this to 'true' to make the chat appear from bottom to top.
      reverse: true,
      itemCount: items.length,
      itemBuilder: (context, index) => Text(items[index]),
    );
  }
}
