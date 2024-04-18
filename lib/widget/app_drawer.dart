import 'package:flutter/material.dart';

import 'package:new_tic/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmF0dXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 220,
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Travel With Hashem",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.card_travel,
              size: 25,
              color: Colors.black,
            ),
            title: const Text(
              "Trips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_list,
              size: 25,
              color: Colors.black,
            ),
            title: const Text(
              "liquidation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.sereenfilterRout);
            },
          ),
          // newMethod("Trips", Icons.card_travel, () {
          //   Navigator.of(context).pushNamed('/');
          // }),
          // newMethod("liquidation", Icons.filter_list, () {
          //   Navigator.of(context).pushNamed(FilterScreen.sereenfilterRout);
          // }),
        ],
      ),
    );
  }

  ListTile newMethod(String title, IconData icon, Function oneTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: oneTap(),
    );
  }
}
