import 'package:flutter/material.dart';
import 'package:progress_follower/manager/session_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text("PROGRESS FOLLOWER"),
              ),
            ),
          ),
          ListTile(title: Text("Settings")),
          ListTile(
            title: Text("Logout"),
            onTap: () {
              SessionManager.logout();
            },
          ),
        ],
      ),
    );
  }
}
