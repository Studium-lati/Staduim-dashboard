import 'package:dashbord/add_book_page.dart';
import 'package:dashbord/add_event_page.dart';
import 'package:dashbord/helper/const.dart';
import 'package:dashbord/home_page.dart';
import 'package:dashbord/notifications_page.dart';
import 'package:dashbord/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _selectedIndex == 0
                ? HomePage()
                : _selectedIndex == 1
                    ?NotificationsPage ()
                    : _selectedIndex == 2
                        ? BookingsManagementPage()
                        : _selectedIndex == 3
                            ? AddEvent()
                            : AdminProfilePage()),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: grayColor,

          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: ' booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart_rounded),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.profile),
              label: 'Profile',
            ),
          ],
        ));
  }
}

