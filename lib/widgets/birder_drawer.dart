import 'package:birderapp/models/drawer_menu.dart';
import 'package:birderapp/screens/add_new_bird_screen.dart';
import 'package:birderapp/widgets/birderapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirderDrawer extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.home,
      title: 'Home',
      route: BirderApp.routeName,
    ),
    MenuItem(
      icon: Icons.add,
      title: 'Add New Bird',
      route: AddNewBird.routeName,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountEmail: Text('Information'),
                accountName: Text('The Birder\'s App'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://png.pngtree.com/png-clipart/20190721/ourmid/pngtree-cute-vivid-flying-bird-png-image_1564068.jpg'),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, BirderApp.routeName),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, AddNewBird.routeName),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                title: Text(
                  'Add New Bird',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Drawer(
    //   child: Column(
    //     children: [
    //       Stack(
    //         children: [
    //           Container(
    //             height: 200.0,
    //             decoration: BoxDecoration(color: Theme.of(context).accentColor),
    //           ),
    //           Container(
    //             margin: EdgeInsets.all(50.0),
    //             child: Center(
    //               child: Column(
    //                 children: [
    //                   CircleAvatar(
    //                     radius: 50.0,
    //                     backgroundImage: NetworkImage(
    //                         'https://png.pngtree.com/png-clipart/20190721/ourmid/pngtree-cute-vivid-flying-bird-png-image_1564068.jpg'),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Text(
    //                     'Birder\'s App',
    //                     style: TextStyle(color: Colors.white, fontSize: 25),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Container(
    //             child: Column(
    //               children: [
    //                 ListTile(
    //                   leading: Icon(
    //                     CupertinoIcons.home,
    //                     color: Colors.white,
    //                   ),
    //                   title: Text(
    //                     'Home',
    //                     textScaleFactor: 1.2,
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //                 ListTile(
    //                   leading: Icon(
    //                     CupertinoIcons.profile_circled,
    //                     color: Colors.white,
    //                   ),
    //                   title: Text(
    //                     'Profile',
    //                     textScaleFactor: 1.2,
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
