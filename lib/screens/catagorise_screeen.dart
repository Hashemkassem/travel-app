import 'package:flutter/material.dart';
import 'package:new_tic/widget/catogeis_item.dart';

import '../app_data.dart';

// ignore: camel_case_types
class Catagorise_Screen extends StatefulWidget {
  const Catagorise_Screen({super.key});

  @override
  State<Catagorise_Screen> createState() => _Catagorise_ScreenState();
}

// ignore: camel_case_types
class _Catagorise_ScreenState extends State<Catagorise_Screen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map((e) => Catao_item(
            title: e.title,
            imagurl: e.imageUrl,
            id: e.id,
          )).toList(),
    );
  }
}
