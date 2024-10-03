import 'package:flutter/material.dart';
import '../../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int rank;
  final VoidCallback? onTap; // 커스터마이즈 가능, 기본값은 null

  const MovieCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.rank,
    this.onTap, // onTap 콜백 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        // 기본적으로 상세 페이지 이동 처리
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailScreen()),
        );
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Image.network(imageUrl, fit: BoxFit.cover, height: 150, width: 100),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
