import 'package:flutter/material.dart';
import '../uikit/widgets/top_bar.dart'; // TopBar import 추가
import 'settings_screen.dart'; // SettingsScreen import 추가

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // 프로필 사진, 닉네임, 이메일 표시
    Row(
    children: [
    CircleAvatar(
    radius: 40,
    backgroundImage: NetworkImage('https://via.placeholder.com/80'), // Placeholder 이미지
    ),
    SizedBox(width: 10),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('닉네임', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    Text('email@example.com', style: TextStyle(fontSize: 14)),
    ],
    ),
    ],
    ),
    SizedBox(height: 20),
    Expanded(
    child: ListView(
    children: [
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('관심목록'),
    onTap: () {
    // 관심목록 페이지로 이동
    },
    ),
    ListTile(
    leading: Icon(Icons.history),
    title: Text('시청기록'),
    onTap: () {
    // 시청기록 페이지로 이동
    },
    ),
    ListTile(
    leading: Icon(Icons.rate_review),
    title: Text('리뷰 평가 관리'),
    onTap: () {
    // 리뷰 평가 관리 페이지로 이동
    },
    ),
    ListTile(
    leading: Icon(Icons.settings),
    title: Text('설정'),
    onTap: () {
    // SettingScreen으로 이동
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsScreen()), // 설정 화면으로 이동
    );
    },
    ),
    ],
    ),
    ),
      // 캘린더 (예시)
      Text('캘린더', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Text('2024년 1월 10일 - 영화 제목', style: TextStyle(fontSize: 14)), // 예시
    ],
    ),
    ),
    );
  }
}
