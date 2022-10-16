import 'package:flutter/material.dart';
import 'package:sikreto/services/fire_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final User? user = FireAuth().currentUser;

  Future<void> signOut() async {
    await FireAuth().signOut();
  }

  Widget _title() {
    return Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 3,
  //     child: Scaffold(
  //       backgroundColor: Colors.deepPurple[100],
  //       body: CustomScrollView(
  //         slivers: <Widget>[
  //           SliverAppBar(
  //             leading: Icon(Icons.menu),
  //             title: _title(),
  //             expandedHeight: 250.0,
  //             bottom: const TabBar(
  //               tabs: [
  //                 Tab(text: 'ALL ITEMS'),
  //                 Tab(text: 'LOGIN'),
  //                 Tab(text: 'SECURE NOTES'),
  //               ],
  //             ),
  //             pinned: true,
  //             flexibleSpace: FlexibleSpaceBar(
  //               title: Text('Demo'),
  //             ),
  //           ),
  //           SliverFixedExtentList(
  //             itemExtent: 50.0,
  //             delegate: SliverChildBuilderDelegate(
  //               (BuildContext context, int index) {
  //                 return Container(
  //                   alignment: Alignment.center,
  //                   color: Colors.lightBlue[100 * (index % 9)],
  //                   child: Text('List Item $index'),
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
