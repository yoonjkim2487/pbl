import 'package:flutter/material.dart';
import '../uikit/widgets/top_bar.dart'; // TopBar import 추가
import '../uikit/widgets/review_list_item.dart';

class ReviewListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(), // TopBar 사용
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ReviewListItem(
            profileImageUrl: 'https://via.placeholder.com/50',
            nickname: 'User $index',
            rating: 4.5,
            review: '이 영화는 정말 재미있었습니다! 강력 추천합니다.',
            movieTitle: '영화 제목 $index',
            moviePosterUrl: 'https://via.placeholder.com/100x150',
          );
        },
      ),
    );
  }
}
