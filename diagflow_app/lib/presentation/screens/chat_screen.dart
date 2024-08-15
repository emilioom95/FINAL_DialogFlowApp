import 'package:diagflow_app/config/dialog_flow/dialogflow_service.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatefulWidget {
  final DialogFlowtter dialogFlowtter;

  ChatScreen({required this.dialogFlowtter});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  late DialogflowService dialogflowService;

  @override
  void initState() {
    super.initState();
    dialogflowService = DialogflowService(dialogFlowtter: widget.dialogFlowtter);
  }

  void _sendMessage(String message) async {
    setState(() {
      _messages.add({"sender": "user", "message": message});
      _isLoading = true;
    });

    final reply = await dialogflowService.detectIntent(message);
    setState(() {
      _messages.add({"sender": "bot", "message": reply});
      _isLoading = false;
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final isUser = message['sender'] == 'user';
                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!isUser) ...[
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/images/bot.png'),
                              ),
                              SizedBox(width: 8.0),
                            ],
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: isUser ? Colors.blue[100] : Colors.green[100],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(message['message'] ?? ''),
                              ),
                            ),
                            if (isUser) ...[
                              SizedBox(width: 8.0),
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/images/user.png'),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: () {
                    final message = _controller.text;
                    _controller.clear();
                    _sendMessage(message);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}