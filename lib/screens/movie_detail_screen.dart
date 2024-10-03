import 'package:flutter/material.dart';
import '../uikit/widgets/sub_title.dart'; // SubTitle import
import '../uikit/widgets/review_card.dart'; // ReviewCard import
import '../uikit/widgets/movie_card.dart'; // MovieCard import

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('영화 상세 정보'), // 필요에 따라 수정 가능
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Stack(
          children: [
          Container(
          height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/400x250'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              ),
            ),
          ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://via.placeholder.com/100x150',
                height: 150,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubTitle(title: '영화 제목'), // 영화 제목
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // 관심 목록에 추가 로직
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // 리뷰 작성 화면으로 이동 로직
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          // 시청 기록에 추가 로직
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('개봉 날짜 · 국가', style: TextStyle(fontSize: 16)),
    SizedBox(height: 8),
    Text('평균 별점: ★★★★★', style: TextStyle(fontSize: 16)),
    SizedBox(height: 8),
    Wrap(
    spacing: 8.0,
    children: ['#드라마', '#로맨스', '#액션', '#코미디']
        .map((genre) => Chip(label: Text(genre)))
        .toList(),
    ),
    SizedBox(height: 8),
    Text(
    '줄거리 요약: 영화 줄거리가 여기에 표시됩니다.',
    style: TextStyle(fontSize: 16),
    ),
    SizedBox(height: 16),
    SubTitle(title: '출연진'),
    SizedBox(height: 8),
    Row(
    children: [
    Column(
    children: [
    CircleAvatar(
    backgroundImage: NetworkImage('https://via.placeholder.com/100'),
    ),
    Text('배우 이름'),
    Text('역할 이름'),
    ],
    ),
    SizedBox(width: 16),
    Column(
    children: [
    CircleAvatar(
    backgroundImage: NetworkImage('https://via.placeholder.com/100'),
    ),
    Text('감독 이름'),
    Text('감독'),
    ],
    ),
    ],
    ),
    SizedBox(height: 16),
    SubTitle(title: '한줄평'),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    SubTitle(title: '한줄평'),
    IconButton(
    icon: Icon(Icons.more_horiz),
    onPressed: () {
    // 한줄평 더 보기 화면으로 이동
    },
    ),
    ],
    ),
    Column(
    children: List.generate(3, (index) => ReviewCard(
    profileImageUrl: 'https://via.placeholder.com/50',
    nickname: 'User $index',
    rating: 4.5,
    review: '이 영화는 정말 재미있습니다!',
    onTap: () {
    // 리뷰 상세 페이지로 이동
    },
    )),
    ),
      SizedBox(height: 16),
      SubTitle(title: '갤러리'),
      Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6, // 예시 데이터 개수
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // 이미지 풀 스크린 보기 로직
                // TODO: 이미지 전체 보기 페이지로 이동
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network('https://via.placeholder.com/150'),
              ),
            );
          },
        ),
      ),
      SizedBox(height: 16),
      SubTitle(title: '비슷한 작품'),
      Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10, // 비슷한 영화 개수
          itemBuilder: (context, index) {
            return MovieCard(
              title: '비슷한 영화 제목 ${index + 1}',
              imageUrl: 'https://via.placeholder.com/100x150',
              rank: index + 1,
              onTap: () {
                // 비슷한 영화에 대한 상세 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(), // 비슷한 영화 상세 페이지로 이동
                  ),
                );
              },
            );
          },
        ),
      ),
    ],
    ),
        ),
            ],
          ),
        ),
    );
  }
}

