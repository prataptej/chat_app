import 'package:chatapp/models/GroupModel.dart';
import 'package:flutter/material.dart';

class GroupsView extends StatelessWidget {
  final List<GroupModel> groups = [
    GroupModel(
        'Family', 'assets/images/groups/group1.jpg', 'Mike', 'Great Work!!', 1),
    GroupModel('Flutter Community', 'assets/images/groups/group2.jpg', 'Me',
        'New Video out on Youtube', 0),
    GroupModel('Youtube Members', 'assets/images/groups/group3.jpg', 'Sara',
        'Looking out for more', 0),
    GroupModel('Avengers', 'assets/images/groups/group4.jpg', 'Hulk',
        'Change our group pic..', 0),
    GroupModel('F.R.I.E.N.D.S', 'assets/images/groups/group5.jpg', 'Chandler',
        'Could you be more specific?', 0),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return GroupBox(
            group: groups[index],
          );
        });
  }
}

class GroupBox extends StatelessWidget {
  const GroupBox({
    Key key,
    this.group,
  }) : super(key: key);
  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      splashColor: Colors.grey,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 3),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 100,
        width: double.infinity,
        color: group.unreadCount > 0
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
                    color: Colors.white, width: group.unreadCount > 0 ? 3 : 1),
                image: DecorationImage(
                  image: AssetImage(group.groupImg),
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
                    group.groupName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    group.lastUser + ': ' + group.lastMessage,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: group.unreadCount > 0
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            //to display if only message have unreadCount>0
            if (group.unreadCount > 0)
              Container(
                height: 25,
                width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text(
                  group.unreadCount.toString(),
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
