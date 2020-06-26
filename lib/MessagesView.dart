import 'package:chatapp/ChatScreen.dart';
import 'package:chatapp/models/MessageModel.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  List<MessageModel> messages = [
    MessageModel(
        'Jane Doe', 'assets/images/single/pic1.jpg', 'How are you?', 1),
    MessageModel(
        'John Doe', 'assets/images/single/pic2.jpg', 'New Video Out!', 0),
    MessageModel(
        'UI Coder', 'assets/images/single/pic3.jpg', 'Looks Great!', 0),
    MessageModel('Alexendra Paul', 'assets/images/single/pic4.jpg',
        'Ok that\'s fine. Looking forward for it', 1),
    MessageModel('Sara ', 'assets/images/single/pic5.jpg', 'How are you?', 0),
    MessageModel('Sheldon ', 'assets/images/single/pic6.jpg', 'Buzzinga!!', 0),
    MessageModel(
        'Joey ', 'assets/images/single/pic7.png', 'Where\'s my food?', 0),
    MessageModel('Stark ', 'assets/images/single/pic8.jpg',
        'I have privatized World Peace!', 0),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageBox(
            message: messages[index],
          );
        });
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    Key key,
    this.message,
  }) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      name: message.username,
                    )));
      },
      splashColor: Colors.grey,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 3),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 100,
        width: double.infinity,
        color: message.unreadCount > 0
            ? Colors.grey.withOpacity(0.6)
            : Colors.grey.withOpacity(0.3),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white,
                    width: message.unreadCount > 0 ? 3 : 1),
                image: DecorationImage(
                  image: AssetImage(message.userImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 25),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    message.lastMessage,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: message.unreadCount > 0
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            //to display if only message have unreadCount>0
            if (message.unreadCount > 0)
              Container(
                height: 25,
                width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text(
                  message.unreadCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
