import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: "token");
    print(value);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => value != null ? Home() : LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
