import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/models/user.dart';
import 'package:multiplatform_solutions/services/asset_manager.dart';
import 'package:multiplatform_solutions/ui/home_page.dart';
import 'package:multiplatform_solutions/ui/widgets/loading.dart';

class UsersLoader extends StatelessWidget {
  const UsersLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width >= 720
          ? null
          : AppBar(
              title: const Text('Adaptive App'),
              centerTitle: true,
            ),
      body: FutureBuilder(
        future: AssetManager.loadAsset(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data);
            List<User> users = [];
            for (var user in data) {
              users.add(User.fromMap(user));
            }
            return HomePage(users: users);
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
