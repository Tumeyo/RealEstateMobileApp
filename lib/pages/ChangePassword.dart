import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isPasswordValid = false;
  bool containsSpecialSymbol = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Нууц үг солих'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPasswordField(
              controller: _currentPasswordController,
              labelText: 'Одоо байгаа нууц үг',
              icon: Icons.lock,
              isFirstField: true,
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              controller: _newPasswordController,
              labelText: 'Шинэ нууц үг',
              icon: Icons.lock,
              isSecondField: true,
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              controller: _confirmPasswordController,
              labelText: 'Нууц үг давтах',
              icon: Icons.lock,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implement save logic
                },
                child: const Text('Хадгалах'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool isFirstField = false,
    bool isSecondField = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: true,
          onChanged: (value) {
            if (isFirstField) {
              setState(() {
                containsSpecialSymbol =
                    value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
              });
            } else if (isSecondField) {
              setState(() {
                isPasswordValid = value.length >= 8;
              });
            }
          },
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(icon, size: 20),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            errorText:
                isFirstField && containsSpecialSymbol ? 'Буруу байна' : null,
          ),
        ),
        if (isSecondField && !isPasswordValid)
          Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.grey[400],
                ),
                const SizedBox(width: 8.0),
                Text(
                  '8 тэмдэгттэй байх ёстой',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                ),
              ],
            ),
          ),
        if (isSecondField && isPasswordValid)
          const Padding(
            padding: EdgeInsets.only(left: 4.0, top: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                ),
                SizedBox(width: 8.0),
                Text(
                  '8 тэмдэгттэй байх ёстой',
                  style: TextStyle(color: Colors.green, fontSize: 12.0),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
