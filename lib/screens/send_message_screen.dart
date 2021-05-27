import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SendMessageScreen extends StatelessWidget {
  static const String routeName = '/sendMessage';
  final TextEditingController _messageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message'),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: 'Enter Your Message Here',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text("Send"),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    FirebaseFirestore.instance.collection('questions').add({
      'message': _messageController.text.toString(),
    });
    _messageController.clear();
  }
}
