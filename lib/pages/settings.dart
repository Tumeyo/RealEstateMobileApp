import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/custom_image.dart';
import 'Notification.dart';
import 'SettingsProfile.dart';
import 'ChangePassword.dart';
import 'login.dart';
// Import the NotificationPage

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody()),
      ],
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Тохиргоо",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CustomImage(
                    profile,
                    width: 80,
                    height: 80,
                    trBackground: true,
                    borderColor: AppColor.primary,
                    radius: 10,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Түмэндэлгэр",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  divider(),
                ],
              ),
            ),
            colorTiles(),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Divider(
        thickness: 0.5,
        color: Colors.grey,
      ),
    );
  }

  Widget colorTiles() {
    return Column(
      children: [
        colorTile(Icons.person_outline, Colors.orange, "Профайл"),
        colorTile(Icons.notifications_rounded, Colors.blue, "Мэдэгдэл"),
        colorTile(Icons.lock, Colors.deepPurple, "Нууц үг солих"),
        colorTile(Icons.logout_outlined, Colors.red, "Гарах"),
      ],
    );
  }

  Widget colorTile(IconData icon, Color color, String text) {
    return ListTile(
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
      onTap: () {
        if (text == "Мэдэгдэл") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationPage()),
          );
        }
        if (text == "Профайл") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SettingsProfilePage()),
          );
        }
        if (text == "Гарах") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
        if (text == "Нууц үг солих") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
          );
        }
      },
    );
  }
}
