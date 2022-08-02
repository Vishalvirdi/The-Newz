import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_newz/login.dart';
import 'package:the_newz/provider/sign_in_provider.dart';
import 'package:the_newz/services/google_auth.dart';
import 'package:the_newz/utils/user_model.dart';
import 'package:the_newz/welcome_screen.dart';

import '../utils/next_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    final imageUrl = "${sp.imageUrl}";
    return Drawer(
        child: Container(
            color: Colors.blue,
            child: ListView(padding: EdgeInsets.zero, children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName:
                      Text("${sp.name}" != null ? "${sp.name}" : "noname"),
                  accountEmail: Text("${sp.email}" != null
                      ? "${sp.email}"
                      : "noname@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl != null
                        ? imageUrl
                        : ("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png")),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: Colors.black)))),
                  onPressed: () {
                    sp.userSignOut();
                    nextScreenReplace(context, const Welcome());
                  },
                  child: const Text("SignOut",
                      style: TextStyle(
                        color: Colors.white,
                      )))
            ])));
  }
}
