import 'package:chatapp/models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ChatScreen extends StatelessWidget {
  final String name;

  ChatScreen({Key key, this.name}) : super(key: key);
  final List<ChatModel> chats = [
    ChatModel('Hi! How are you?', 'John Doe', '9:20 AM'),
    ChatModel('I am Fine', 'me', '9:21 AM'),
    ChatModel('How you doing?', 'me', '9:22 AM'),
    ChatModel('I am Doing Great!', 'John Doe', '9:25 AM'),
    ChatModel('I heard about your new video', 'John Doe', '9:26 AM'),
    ChatModel('I will upload it soon', 'me', '9:27 AM'),
    ChatModel('On what topic it is?', 'John Doe', '9:27 AM'),
    ChatModel('Chat App UI', 'me', '9:28 AM'),
    ChatModel('I am waiting for it!', 'John Doe', '9:29 AM'),
    ChatModel('Subscribe to my channel', 'me', '9:30 AM'),
    ChatModel('And press bell icon so you get updates', 'me', '9:30 AM'),
    ChatModel('I have already done it', 'John Doe', '9:31 AM'),
    ChatModel('Thank you', 'me', '9:32 AM'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatBox(
                  size: size,
                  chat: chats[index],
                );
              },
            ),
          ),
          CustomInputBox(size: size)
        ],
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  const ChatBox({
    Key key,
    @required this.size,
    this.chat,
  }) : super(key: key);

  final Size size;
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chat.user == 'me' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * 0.8,
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(
              top: 5,
              bottom: 2,
              left: chat.user == 'me' ? size.width * 0.2 : 20,
              right: chat.user != 'me' ? size.width * 0.2 : 20),
          decoration: BoxDecoration(
            color: chat.user == 'me' ? Colors.black : Colors.blue,
            border: Border.all(
                color: chat.user == 'me' ? Colors.grey : Colors.blue, width: 2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft:
                  chat.user != 'me' ? Radius.circular(0) : Radius.circular(50),
              topRight: Radius.circular(50),
              bottomRight:
                  chat.user == 'me' ? Radius.circular(0) : Radius.circular(50),
            ),
          ),
          child: Text(
            chat.message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            chat.time,
            style: TextStyle(
              color: Colors.white30,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}

class CustomInputBox extends StatelessWidget {
  const CustomInputBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.grey, width: 2),
            color: Colors.black,
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your message..',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(
                Icons.attach_file,
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
