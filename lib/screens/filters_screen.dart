// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:new_tic/widget/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const sereenfilterRout = '/filters';

  final Function(Map<String, bool>) savfilter;
  final Map<String, bool> currentfilters;
  const FilterScreen(
      {super.key, required this.savfilter, required this.currentfilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _WINTER = false;
  var _FAMILY = false;

  @override
  void initState() {
    _summer = widget.currentfilters['summer']!;
    _WINTER = widget.currentfilters['winter']!;
    _FAMILY = widget.currentfilters['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Filters "),
        actions: [
          IconButton(
              onPressed: () {
                final selectfilter = {
                  'summer': _summer,
                  'winter': _WINTER,
                  'family': _FAMILY
                };
                widget.savfilter(selectfilter);
              },
              icon: const Icon(Icons.save))
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    activeColor: Colors.black,
                    title: const Text(
                      "Summer Trips",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("show only Summer Trips"),
                    value: _summer,
                    onChanged: (newValue) {
                      setState(() {
                        _summer = newValue;
                      });
                    }),
                SwitchListTile(
                    activeColor: Colors.black,
                    title: const Text(
                      "Winter Trips",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("show only Winter Trips"),
                    value: _WINTER,
                    onChanged: (newValue1) {
                      setState(() {
                        _WINTER = newValue1;
                      });
                    }),
                SwitchListTile(
                    activeColor: Colors.black,
                    title: const Text(
                      "Family Trips",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("show only Family Trips"),
                    value: _FAMILY,
                    onChanged: (newValue2) {
                      setState(() {
                        _FAMILY = newValue2;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
