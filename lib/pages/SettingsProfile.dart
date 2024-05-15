import 'package:flutter/material.dart';

class SettingsProfilePage extends StatefulWidget {
  const SettingsProfilePage({super.key});

  @override
  _SettingsProfilePageState createState() => _SettingsProfilePageState();
}

class _SettingsProfilePageState extends State<SettingsProfilePage> {
  String _name = 'Түмэндэлгэр';
  String _phoneNumber = '123456789';
  String _email = 'tumendelger@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профайл тохиргоо'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  _showProfileOptionsDialog();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage('assets/images/user1.png'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Нэр'),
              subtitle: Text(_name),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _showEditDialog('Нэрээ оруулна уу.', _name, (value) {
                    setState(() {
                      _name = value;
                    });
                  });
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Утасны дугаар'),
              subtitle: Text(_phoneNumber),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _showEditDialog('Утасны дугаараа оруулна уу.', _phoneNumber,
                      (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  });
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Мэйл хаяг'),
              subtitle: Text(_email),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _showEditDialog('Мэйл хаягаа оруулна уу.', _email, (value) {
                    setState(() {
                      _email = value;
                    });
                  });
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  void _showProfileOptionsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Профайл зураг'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Зураг солих'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement update logic
                },
              ),
              ListTile(
                title: const Text('Зураг устгах'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement delete logic
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditDialog(
      String title, String initialValue, Function(String) onValueChanged) {
    showDialog(
      context: context,
      builder: (context) {
        String updatedValue = initialValue;
        return AlertDialog(
          title: Text(' $title'),
          content: TextFormField(
            initialValue: initialValue,
            onChanged: (value) => updatedValue = value,
            decoration: InputDecoration(
              hintText: ' $title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Цуцлах'),
            ),
            TextButton(
              onPressed: () {
                onValueChanged(updatedValue);
                Navigator.pop(context);
              },
              child: const Text('Хадгалах'),
            ),
          ],
        );
      },
    );
  }
}
