import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyListTile(
          title: 'Theme',
          prefixIcon: Icons.palette,
        ),
        MyListTile(
          title: 'Privacy',
          prefixIcon: Feather.lock,
        ),
        MyListTile(
          title: 'Personal',
          prefixIcon: Feather.user,
        ),
        MyListTile(
          title: 'About',
          prefixIcon: Feather.info,
        ),
      ],
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key key,
    @required this.title,
    @required this.prefixIcon,
  }) : super(key: key);
  final String title;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      onTap: () {},
      leading: Icon(
        prefixIcon,
        color: Colors.white,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      trailing: Icon(
        Feather.chevron_right,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
