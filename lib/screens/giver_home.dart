import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/tabs/map_tab.dart';
import 'package:greenhands_mobile/tabs/more_tab.dart';
import 'package:greenhands_mobile/tabs/needs_tab.dart';
import 'package:greenhands_mobile/tabs/notifications_tab.dart';
import 'package:greenhands_mobile/tabs/vouch_requests_tab.dart';

class GiverHome extends StatefulWidget {
  const GiverHome({Key? key}) : super(key: key);

  @override
  State<GiverHome> createState() => _GiverHomeState();
}

class _GiverHomeState extends State<GiverHome> {
  int _selectedIndex = 0;
  String _title = "map";


  final mapTab = MapTab();
  final needsTab = NeedsTab();
  final notificationTab = NotificationsTab();
  final moreTab = MoreTab();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index){
        case 0:
          _title = "map";
          break;
        case 1:
          _title = "needs";
          break;
        case 2:
          _title = "notifications";
          break;
        case 3:
          _title = "more";
          break;
      }
    });
  }

  Widget buildTab(int index){
    switch (index){
      case 0:
        return mapTab;
      case 1:
        return needsTab;
      case 2:
        return notificationTab;
      case 3:
        return moreTab;
      default:
        return mapTab;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: buildTab(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.map),
            label: 'map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'needs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'more',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lime,
        onTap: _onItemTapped,
      ),
    );
  }
}