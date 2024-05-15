import 'package:flutter/material.dart';
import 'package:realestate_project/widgets/bottombar_item.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/custom_image.dart';
import 'home.dart';
import 'Notification.dart';
import 'SettingsProfile.dart';
import 'ChangePassword.dart';
import 'login.dart';

import 'package:realestate_project/pages/chat.dart';
import 'package:realestate_project/pages/explore.dart';
import 'package:realestate_project/pages/like.dart';
import 'package:realestate_project/pages/settings.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;
  late List<Map<String, dynamic>> favoriteItems = [];

  late List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    LikePage(favoriteItems: favoriteItems),
    const ChatPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_activeTab],
      drawer: _buildDrawer(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Түмэндэлгэр',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: CustomImage(
                profile,
                width: 100,
                height: 100,
                trBackground: true,
                borderColor: AppColor.blue,
                radius: 10,
              ),
            ),
            decoration: const BoxDecoration(
              color: AppColor.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.orange),
            title: const Text('Профайл'),
            onTap: () {
              // Navigate to the profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_rounded, color: Colors.blue),
            title: const Text('Мэдэгдэл'),
            onTap: () {
              // Navigate to the notifications page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.deepPurple),
            title: const Text('Нууц үг солих'),
            onTap: () {
              // Navigate to the change password page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined, color: Colors.red),
            title: const Text('Гарах'),
            onTap: () {
              // Navigate to the logout page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }


  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _pages.length,
              (index) => BottomBarItem(
            _pages[index].runtimeType == HomePage ? Icons.home :
            _pages[index].runtimeType == ExplorePage ? Icons.search :
            _pages[index].runtimeType == LikePage ? Icons.favorite :
            _pages[index].runtimeType == ChatPage ? Icons.forum :
            _pages[index].runtimeType == SettingsPage ? Icons.settings : Icons.error,
            isActive: _activeTab == index,
            activeColor: Colors.blue,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
