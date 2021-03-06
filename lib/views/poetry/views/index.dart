/*
 * @Description: 
 * @Author: chenebenzheng
 * @Date: 2022-02-16 15:00:11
 * @LastEditTime: 2022-02-16 16:40:25
 * @LastEditors: chenebenzheng
 * @Reference: 
 */
import 'package:flutter/material.dart';
import './home.dart';

class PoetryApp extends StatefulWidget {
  const PoetryApp({Key? key}) : super(key: key);

  @override
  State<PoetryApp> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<PoetryApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PoetryList(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
