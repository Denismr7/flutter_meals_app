import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  const FiltersScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Text('Filters!'),
      ),
    );
  }
}
