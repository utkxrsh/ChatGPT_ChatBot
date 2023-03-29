import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatgpt_flutter/messages_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MessagesModel(),
      child: const MaterialApp(
        home: ChatGPTPage(),
      ),
    ),
  );
}

class ChatGPTPage extends StatelessWidget {
  const ChatGPTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatBot"),
      ),
      body: Column(
        children: [
          const Expanded(child: MessagesList()),
          MessageInput(),
        ],
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagesModel>(
      builder: (context, messages, child) {
        return ListView.builder(
          itemCount: messages.items.length,
          itemBuilder: (context, index) {
            final message = messages.items[index];
            return ListTile(
              title: Text(message.content),
              subtitle: Text(message.sender),
            );
          },
        );
      },
    );
  }
}

class MessageInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(hintText: 'Type your message....'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              context.read<MessagesModel>().addUserMessage(_controller.text);
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
