import 'package:firebase/views/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/home_page.dart';

class OnBoardWidget extends StatefulWidget {
  const OnBoardWidget({Key key}) : super(key: key);

  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  bool _isLogged;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('usermis currently signed out');
        _isLogged = false;
      } else {
        print('user is signed in');
        _isLogged = true;
      }

      setState(() {
        
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLogged ==null?Center(child: CircularProgressIndicator()):_isLogged ? HomePage() : SignInPage();
  }
}
