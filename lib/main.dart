import 'package:baidudisk/login_page.dart';
import 'package:flutter/material.dart';
import 'package:baidudisk/files_page.dart';

import 'login_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baidu Disk',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.archive), title: Text('文件')),
    BottomNavigationBarItem(icon: Icon(Icons.archive), title: Text('我的')),
  ];

//  final pages = [FilePage(), PersonalCenter()];
  final pages = [FilesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: (int index) => setState(() => _selectedIndex = index),
        ));
  }
}

//typedef SearchInputOnFocusCallback = void Function();
//typedef SerchInputOnSubmittedCallback = void Function(String value);
//
//class SearchInputWidget extends StatelessWidget {
//  SearchInputOnFocusCallback onTap;
//  SerchInputOnSubmittedCallback onSubmitted;
//
//  SearchInputWidget({
//    this.onTap, this.onSubmitted
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return TextField(
//      onTap: onTap,
//      onSubmitted: onSubmitted,
//      decoration: InputDecoration(
//          hintText: '搜索网盘文件',
//          filled: true,
//          fillColor: Color.fromARGB(255, 240, 240, 240),
//          contentPadding: EdgeInsets.only(left: 0),
//          border: OutlineInputBorder(
//              borderSide: BorderSide.none,
//              borderRadius: BorderRadius.circular(20)
//          ),
//          prefixIcon: Icon(
//            Icons.search,
//            color: Colors.black26,
//          )
//      ),
//    );
//  }
//}


