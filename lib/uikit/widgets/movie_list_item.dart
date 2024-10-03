import 'package:flutter/material.dart';
import '../../screens/movie_detail_screen.dart';

class MovieListItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String releaseDate;
  final VoidCallback? onTap; // 기본 onTap 콜백 추가

  const MovieListItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    this.onTap, // 외부에서 onTap을 커스터마이즈할 수 있도록 함
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        // 상세 페이지 이동 기본 처리
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailScreen()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            releaseDate,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
