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
    return const Text('Home');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: signOut,
        child: const Text('Sign Out'),
      ),
    );
  }

  Widget baseWidget() {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
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
    );
  }

  Widget _listMePasswords() {
    var items = List<String>.generate(10, (i) => 'Item $i');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text(items[index]),
            subtitle: Text(items[index]),
            // trailing: Icon(Icons.copy),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> tabs = <String>['Tab 1', 'Tab 2'];
    const int lenTabs = 3;
    return DefaultTabController(
      length: lenTabs, // This is the number of tabs.
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.green,
          // icon: const IconButton(Icons.add),
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          label: const Text('ADD ITEM'),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_book_outlined,
                    ),
                  ),
                  floating: true,
                  snap: true,
                  pinned: true,
                  // leading: ,
                  actions: const <Widget>[
                    Icon(Icons.add),
                    // _userUid(),
                  ],
                  title:
                      // const Text('Books'), // This is the title in the app bar.
                      _title(),
                  expandedHeight: 150.0,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  forceElevated: innerBoxIsScrolled,
                  bottom: const TabBar(
                      // These are the widgets to put in each tab in the tab bar.
                      // tabs: tabs.map((String name) => Tab(text: name)).toList(),
                      tabs: [
                        Tab(icon: Icon(Icons.directions_car)),
                        Tab(icon: Icon(Icons.directions_transit)),
                        Tab(icon: Icon(Icons.directions_bike)),
                      ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Icon(Icons.directions_car),
              _signOutButton(),
              // const Icon(Icons.directions_transit),
              _listMePasswords(),
              const Icon(Icons.directions_bike),
            ],
            // These are the contents of the tab views, below the tabs.

            //   children: tabs.map((String name) {
            //     return SafeArea(
            //       top: false,
            //       bottom: false,
            //       child: Builder(
            //         // This Builder is needed to provide a BuildContext that is
            //         // "inside" the NestedScrollView, so that
            //         // sliverOverlapAbsorberHandleFor() can find the
            //         // NestedScrollView.
            //         builder: (BuildContext context) {
            //           return CustomScrollView(
            //             // The "controller" and "primary" members should be left
            //             // unset, so that the NestedScrollView can control this
            //             // inner scroll view.
            //             // If the "controller" property is set, then this scroll
            //             // view will not be associated with the NestedScrollView.
            //             // The PageStorageKey should be unique to this ScrollView;
            //             // it allows the list to remember its scroll position when
            //             // the tab view is not on the screen.
            //             key: PageStorageKey<String>(name),
            //             slivers: <Widget>[
            //               SliverOverlapInjector(
            //                 // This is the flip side of the SliverOverlapAbsorber
            //                 // above.
            //                 handle:
            //                     NestedScrollView.sliverOverlapAbsorberHandleFor(
            //                         context),
            //               ),
            //               SliverPadding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 // In this example, the inner scroll view has
            //                 // fixed-height list items, hence the use of
            //                 // SliverFixedExtentList. However, one could use any
            //                 // sliver widget here, e.g. SliverList or SliverGrid.
            //                 sliver: SliverFixedExtentList(
            //                   // The items in this example are fixed to 48 pixels
            //                   // high. This matches the Material Design spec for
            //                   // ListTile widgets.
            //                   itemExtent: 48.0,
            //                   delegate: SliverChildBuilderDelegate(
            //                     (BuildContext context, int index) {
            //                       // This builder is called for each child.
            //                       // In this example, we just number each list item.
            //                       return ListTile(
            //                         title: Text('Item $index'),
            //                       );
            //                     },
            //                     // The childCount of the SliverChildBuilderDelegate
            //                     // specifies how many children this inner list
            //                     // has. In this example, each tab has a list of
            //                     // exactly 30 items, but this is arbitrary.
            //                     childCount: 30,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //       ),
            //     );
            //   }).toList(),
          ),
        ),
      ),
    );
  }
}
