import 'package:flutter/material.dart';
import '../uikit/widgets/top_bar.dart'; // TopBar import
import '../uikit/widgets/sub_title.dart'; // SubTitle import

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(), // TopBar 사용
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitle(title: '계정 연동 설정'),
            SwitchListTile(
              title: Text('카카오 연동'),
              value: true, // 기본값 예시
              onChanged: (bool value) {
                // 카카오 연동 상태 변경 로직
              },
            ),
            SwitchListTile(
              title: Text('네이버 연동'),
              value: false, // 기본값 예시
              onChanged: (bool value) {
                // 네이버 연동 상태 변경 로직
              },
            ),
            Divider(), // 구분선 추가
            SubTitle(title: '고객센터'),
            ListTile(
              title: Text('문의하기/FAQ'),
              onTap: () {
                // 고객센터 문의하기 화면으로 이동
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text('공지사항'),
              onTap: () {
                // 공지사항 화면으로 이동
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            Divider(), // 두 번째 구분선 추가
            ListTile(
              title: Text('로그아웃'),
              onTap: () {
                // 로그아웃 처리 로직
              },
              trailing: Icon(Icons.exit_to_app),
            ),
            ListTile(
              title: Text('계정 삭제'),
              onTap: () {
                // 계정 삭제 처리 로직
              },
              trailing: Icon(Icons.delete_forever),
            ),
          ],
        ),
      ),
    );
  }
}
