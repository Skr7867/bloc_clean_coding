import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin').then((value) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                });
              });
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: SafeArea(child: Column(children: [Text('Home Screen')])),
    );
  }
}
