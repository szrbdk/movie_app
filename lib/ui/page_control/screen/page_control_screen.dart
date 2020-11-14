import 'package:flutter/material.dart';
import 'package:progress_follower/ui/dashboard/screen/dashboard_screen.dart';
import 'package:progress_follower/ui/movies/screen/movies_screen.dart';

class PageControlScreen extends StatefulWidget {
  @override
  _PageControlScreenState createState() => _PageControlScreenState();
}

class _PageControlScreenState extends State<PageControlScreen> {
  int _pageIndex;

  @override
  void initState() {
    _pageIndex = 0;
    super.initState();
  }

  List<Widget> widgets = <Widget>[DashboardScreen(), MoviesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movies",
          ),
        ],
      ),
      body: IndexedStack(
        index: _pageIndex,
        children: widgets,
      ),
    );
  }
}
