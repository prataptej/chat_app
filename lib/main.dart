import 'package:chatapp/GroupsView.dart';
import 'package:chatapp/MessagesView.dart';
import 'package:chatapp/SettingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        fontFamily: 'Raleway',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = new PageController(initialPage: 0);
  int _currentIndex = 0;
  List<String> titles = ['Messages', 'Groups', 'Settings'];
  List<IconData> icons = [Feather.plus, Icons.group_add, Icons.more_vert];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          titles[_currentIndex],
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              icons[_currentIndex],
              color: Colors.white,
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          //for messages
          MessagesView(),
          //for groups
          GroupsView(),
          //for settings
          SettingsView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          //to navigate through pageview with bottom navigation
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        items: [
          BottomNavigationBarItem(
            title: Text('Messages'),
            icon: Icon(Feather.message_square),
          ),
          BottomNavigationBarItem(
            title: Text('Groups'),
            icon: Icon(Feather.users),
          ),
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(Feather.settings),
          ),
        ],
      ),
    );
  }
}
