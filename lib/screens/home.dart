import 'package:flutter/material.dart';
import 'package:login_popup_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(child: Center(child: Text('Home'))),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => ScreenLogin()),
      (route) => false,
    );
  }
}
