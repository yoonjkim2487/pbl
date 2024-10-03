import 'package:flutter/material.dart';
import 'home_screen.dart'; // 홈 화면
import 'search_screen.dart'; // 검색 화면
import 'profile_screen.dart'; // 마이페이지
import '../uikit/widgets/top_bar.dart'; // TopBar import 추가

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 하단 내비게이션 바의 현재 선택된 인덱스

  final List<Widget> _screens = [
    HomeScreen(), // 홈 화면
    SearchScreen(), // 검색 화면
    ProfileScreen(), // 마이페이지
  ];

  void _onItemTapped(int index) {
    setState(() {
      // 선택된 인덱스 업데이트
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(), // TopBar 사용
      body: _screens[_selectedIndex], // 현재 선택된 화면 표시
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
        currentIndex: _selectedIndex, // 현재 선택된 인덱스
        onTap: _onItemTapped, // 클릭된 인덱스에 따라 화면 전환
      ),
    );
  }
}
