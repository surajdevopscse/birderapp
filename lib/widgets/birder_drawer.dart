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
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://png.pngtree.com/png-clipart/20190721/ourmid/pngtree-cute-vivid-flying-bird-png-image_1564068.jpg'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Birder\'s App',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, menuItems[index].route.toString());
                      },
                      child: ListTile(
                        leading: Icon(menuItems[index].icon,
                            color: Theme.of(context).primaryColorDark),
                        title: Text(
                          '${menuItems[index].title}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 6,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
