import 'package:advance_flutter/firebase_realtime_database/firebase_database_manager.dart';
import 'package:flutter/material.dart';

class TablesView extends StatefulWidget {
  const TablesView({super.key});
  @override
  State<TablesView> createState() => _TablesViewState();
}

class _TablesViewState extends State<TablesView> {
  @override
  void initState() {
    super.initState();

    FirebaseDatabaseManager().fetchCoffeeShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
      ),
      body: ListView(),
    );
  }
}
