import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/tabs/map_tab.dart';
import 'package:greenhands_mobile/tabs/more_tab.dart';
import 'package:greenhands_mobile/tabs/notifications_tab.dart';
import 'package:greenhands_mobile/tabs/vouch_requests_tab.dart';

class OrganizerHome extends StatefulWidget {
  const OrganizerHome({Key? key}) : super(key: key);

  @override
  State<OrganizerHome> createState() => _OrganizerHomeState();
}

class _OrganizerHomeState extends State<OrganizerHome> {
  int _selectedIndex = 0;
  String _title = "map";


  final mapTab = MapTab();
  final vouchesTab = VouchRequestsTab();
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
          _title = "vouches";
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
        _title = "map";
        return mapTab;
      case 1:
        _title = "vouches";
        return vouchesTab;
      case 2:
        _title = "notifications";
        return notificationTab;
      case 3:
        _title = "more";
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
            label: 'vouches',
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