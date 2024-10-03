import 'package:flutter/material.dart';
import '../uikit/widgets/top_bar.dart'; // TopBar import 추가
import '../uikit/widgets/movie_card.dart'; // MovieCard import
import '../uikit/widgets/actor_card.dart'; // ActorCard import 추가
import '../uikit/widgets/sub_title.dart'; // SubTitle import 추가

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> recentSearches = [];
  List<String> popularSearches = ['영화1', '영화2', '영화3', '영화4', '영화5'];
  TextEditingController searchController = TextEditingController(); // 검색어 입력 컨트롤러
  bool isSearching = false; // 검색 상태

  void performSearch(String query) {
    // 검색 결과 뷰어를 보여주는 로직
    setState(() {
      isSearching = true; // 검색 상태로 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        // 검색창
        Row(
        children: [
        Expanded(
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: '영화, TV 프로그램, 인물을 검색해보세요',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              // 최근 검색어에 추가
              setState(() {
                recentSearches.insert(0, value);
                if (recentSearches.length > 5) {
                  recentSearches.removeLast(); // 최대 5개 유지
                }
                performSearch(value); // 검색 실행
              });
            }
          },
        ),
      ),
      SizedBox(width: 8),
      IconButton(
        icon: Icon(Icons.cancel, color: Colors.red), // 취소 버튼
        onPressed: () {
          setState(() {
            searchController.clear(); // 입력칸 비우기
            isSearching = false; // 검색 상태를 false로 변경
          });
        },
      ),
      ],
    ),
    SizedBox(height: 10),
    // 검색어 결과 표시
    if (isSearching) ...[
    // 검색 결과가 있을 경우
    Expanded(
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SubTitle(title: '검색 결과'),
    // 영화 결과
    Container(
    height: 200,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 3, // 예시 데이터 개수
    itemBuilder: (context, index) {
    return MovieCard(
    title: '${searchController.text} 영화 제목 ${index + 1}',
    imageUrl: 'https://via.placeholder.com/100x150',
    rank: index + 1,
    onTap: () {
    // TODO: 영화 상세 페이지로 이동
    },
    );
    },
    ),
    ),
    SizedBox(height: 16),
    // 시리즈 결과
    SubTitle(title: '시리즈'),
    Container(
    height: 200,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 3, // 예시 데이터 개수
    itemBuilder: (context, index) {
    return MovieCard(
    title: '${searchController.text} 시리즈 제목 ${index + 1}',
    imageUrl: 'https://via.placeholder.com/100x150',
    rank: index + 1,
    onTap: () {
    // TODO: 시리즈 상세 페이지로 이동
    },
    );
    },
    ),
    ),
    SizedBox(height: 16),
    // 출연진 결과
    SubTitle(title: '출연진'),
    Container(
    height: 150,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5, // 예시 데이터 개수
    itemBuilder: (context, index) {
    return ActorCard(
    name: '${searchController.text} 배우 ${index + 1}',
      imageUrl: 'https://via.placeholder.com/80',
      onTap: () {
        // TODO: 배우 상세 페이지로 이동
      },
    );
    },
    ),
    ),
    ],
    ),
    ),
    ),
    ] else ...[
      // 최근 검색어 섹션
      if (recentSearches.isNotEmpty) ...[
        Align(
          alignment: Alignment.centerLeft,
          child: Text('최근 검색어', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Wrap(
          children: recentSearches.map((search) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                // 최근 검색어를 클릭 시 해당 검색어로 검색
                setState(() {
                  searchController.text = search; // 입력칸에 검색어 채우기
                  isSearching = true; // 검색 상태 변경
                });
              },
              child: Chip(
                label: Text(search),
                onDeleted: () {
                  setState(() {
                    recentSearches.remove(search); // 검색어 삭제
                  });
                },
              ),
            ),
          )).toList(),
        ),
      ],
      SizedBox(height: 10),
      // 인기 검색어 섹션
      Align(
        alignment: Alignment.centerLeft,
        child: Text('인기 검색어', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Wrap(
        children: popularSearches.map((search) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              // 인기 검색어 클릭 시 해당 검색어로 검색
              setState(() {
                searchController.text = search; // 입력칸에 검색어 채우기
                isSearching = true; // 검색 상태 변경
              });
            },
            child: Chip(
              label: Text(search),
            ),
          ),
        )).toList(),
      ),
    ],
          ],
        ),
      ),
    );
  }
}

