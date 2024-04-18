import 'package:flutter/material.dart';
import 'package:new_tic/screens/catagorise_screeen.dart';
import 'package:new_tic/screens/favorait_screen.dart';
import 'package:new_tic/widget/app_drawer.dart';

import '../models/trips.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key, required this.favoriteTrips});

  final List<Trip> favoriteTrips;

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  void _selectcsren(int index) {
    setState(() {
      _selectedscreenindex = index;
    });
  }

  int _selectedscreenindex = 0;

  late List<Map<String, Object>> _screen;

  @override
  void initState() {
    _screen = [
      {'screen': const Catagorise_Screen(), 'title': "Trips Categories"},
      {
        'screen': FavoraitScreen(
          favoteTrips: widget.favoriteTrips,
        ),
        'title': "Trips Favorite"
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _screen[_selectedscreenindex]['title'] as String,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        currentIndex: _selectedscreenindex,
        onTap: _selectcsren,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Favorite")
        ],
      ),
      body: _screen[_selectedscreenindex]['screen'] as Widget?,
    );
  }
}
