import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              leading: Icon(Icons.menu),
              title: Text('Home'),
              expandedHeight: 250.0,
              bottom: TabBar(
                tabs: [
                  Tab(text: 'ALL ITEMS'),
                  Tab(text: 'LOGIN'),
                  Tab(text: 'SECURE NOTES'),
                ],
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Demo'),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
