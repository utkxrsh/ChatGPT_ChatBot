import 'package:flutter/material.dart';
import 'package:chatgpt_flutter/message.dart';

class MessagesModel extends ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get items => _messages;

  void addUserMessage(String content) {
    _messages.add(Message(content: content, sender: 'You'));
    notifyListeners();
  }

  void addGptMessage(String content) {
    _messages.add(Message(content: content, sender: 'Gpt-3.5'));
    notifyListeners();
  }
}
