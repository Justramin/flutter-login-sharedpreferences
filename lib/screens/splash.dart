import 'package:flutter/material.dart';
import 'package:login_popup_project/main.dart';
import 'package:login_popup_project/screens/home.dart';
import 'package:login_popup_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('assets/images/404.png')));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> goToLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPres = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPres.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      goToLogin();
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    }
  }
}
