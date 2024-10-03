import 'package:flutter/material.dart';
import '../uikit/widgets/top_bar.dart'; // TopBar import 추가
import '../uikit/widgets/movie_list_item.dart'; // MovieListItem import 추가

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<String> _selectedGenres = [];
  String _sortBy = 'latest'; // 기본 정렬 기준
  List<Map<String, dynamic>> _movies = List.generate(20, (index) => {
    'title': '영화 제목 ${index + 1}',
    'imageUrl': 'https://via.placeholder.com/100x150',
    'releaseDate': '2023-05-${(index + 1).toString().padLeft(2, '0')}',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(), // TopBar 사용
      body: Column(
        children: [
          // 장르 필터
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Action', 'Comedy', 'Horror', 'Drama', 'Sci-Fi']
                    .map((genre) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text('#$genre'),
                    selected: _selectedGenres.contains(genre),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedGenres.add(genre);
                        } else {
                          _selectedGenres.remove(genre);
                        }
                      });
                    },
                  ),
                ))
                    .toList(),
              ),
            ),
          ),
          // 정렬 기준 선택
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: _sortBy,
                  items: [
                    DropdownMenuItem(value: 'latest', child: Text('최신순')),
                    DropdownMenuItem(value: 'popular', child: Text('인기순')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _sortBy = value!; // 정렬 방식 변경
                    });
                  },
                ),
              ],
            ),
          ),
          // 영화 리스트
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _movies.length,
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return MovieListItem(
                  title: _movies[index]['title'],
                  imageUrl: _movies[index]['imageUrl'],
                  releaseDate: _movies[index]['releaseDate'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
