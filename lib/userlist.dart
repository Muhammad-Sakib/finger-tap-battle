import 'package:finger_tap_battle/user_profile.dart';
import 'package:flutter/material.dart';

import 'userdata.dart';

// ignore: must_be_immutable
class UserList extends StatelessWidget {
  UserList({super.key});
  List<Map> userData = User.userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('User List')),
        titleTextStyle: TextStyle(fontSize: 30),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: userData.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userData[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProfile(
                            index: index,
                          )));
            },
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      user['name'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Text('Age: ${user['age']}'),
                  // Text('Email: ${user['email']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
