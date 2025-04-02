import 'package:flutter/material.dart';
import 'package:login_popup_project/main.dart';
import 'package:login_popup_project/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User Name',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  checkLogin(context);
                },
                icon: Icon(Icons.check),
                label: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      //Go To Home
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(
        ctx,
      ).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text('Username and Password does not match!'),
        ),
      );
    }
  }
}
