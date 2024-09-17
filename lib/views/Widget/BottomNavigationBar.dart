import 'package:flutter/material.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({
    super.key,
  });

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.brown[500],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange[300],
        onTap: (value) {
          setState(() {
            selectedIndex = value;

            if (selectedIndex == 0) {
              Navigator.pushNamed(context, "/home");
            } else if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/Favorite");
            } else {
              Navigator.pushNamed(context, "/Login");
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
            // activeIcon: InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, "/home");
            //   },
            // )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "",

            // activeIcon: InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, "/Login");
            //   },
            // )
          )
        ]);
  }
}
