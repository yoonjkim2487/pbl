import 'package:flutter/material.dart';
import '../uikit/widgets/more_button.dart';
import '../uikit/widgets/top_bar.dart'; // TopBar import 추가
import '../uikit/widgets/sub_title.dart';
import '../uikit/widgets/movie_card.dart';
import '../uikit/widgets/review_card.dart';
import '../uikit/widgets/recommendation_card.dart';
import 'movie_list_screen.dart'; // 영화 목록 화면 import
import 'review_list_screen.dart'; // 리뷰 목록 화면 import

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubTitle(title: '최신 인기 콘텐츠'),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return MovieCard(
                  title: '영화 제목 ${index + 1}',
                  imageUrl: 'https://via.placeholder.com/100x150',
                  rank: index + 1,
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubTitle(title: '최신 한줄평'),
              MoreButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewListScreen()),
                );
              }),
            ],
          ),
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ReviewCard(
                  profileImageUrl: 'https://via.placeholder.com/40',
                  nickname: '사용자$index',
                  rating: 4.5,
                  review: '이 영화는 정말 재미있었습니다! 추천합니다.',
                  onTap: () {
                    // TODO: 리뷰 상세 페이지로 이동
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          SubTitle(title: '당신을 위한 추천'),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return RecommendationCard(
                  imageUrl: 'https://via.placeholder.com/250x200',
                  subtitle: '인상적인 대사 ${index + 1}',
                  content: '이 영화의 줄거리와 감동적인 순간에 대한 간단한 설명...',
                  onTap: () {
                    // TODO: 영화 상세 페이지로 이동
                  },
                );
              },
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieListScreen()),
                );
              },
              child: Text('더 많은 작품 보러가기'),
            ),
          ),
        ],
      ),
    ),
    ),
    );
  }
}
