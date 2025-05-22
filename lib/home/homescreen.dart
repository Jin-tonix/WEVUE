import 'package:flutter/material.dart';
import '../setting/settingscreen.dart';
import 'communityscreen.dart';
import 'community_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  bool _isSetting = false; // 설정 화면 여부

  final List<Widget> _pages = const [
    CommunityScreen(),
    CategoryGridScreen(),
    MyPageScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isSetting = false;
    });
  }

  void _openSetting() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'WEVIEW',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.indigo),
            onPressed: _openSetting,
          ),
        ],
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: _isSetting
          ? const SettingScreen()
          : IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}



// ------ 페이지 위젯 ------


class CategoryGridScreen extends StatefulWidget {
  const CategoryGridScreen({super.key});

  @override
  State<CategoryGridScreen> createState() => _CategoryGridScreenState();
}

class _CategoryGridScreenState extends State<CategoryGridScreen> {
  final TextEditingController _searchController = TextEditingController();

  // 카테고리 리스트 (불변)
  final categories = const [
    {'label': '병원', 'icon': Icons.local_hospital},
    {'label': '약국', 'icon': Icons.local_pharmacy},
    {'label': '음식점', 'icon': Icons.restaurant},
    {'label': '카페', 'icon': Icons.local_cafe},
    {'label': '관광명소', 'icon': Icons.location_on},
    {'label': '문화시설', 'icon': Icons.museum},
    {'label': '숙박', 'icon': Icons.hotel},
    {'label': '지하철역', 'icon': Icons.subway},
    {'label': '편의점', 'icon': Icons.local_convenience_store},
  ];

  void _onSearch(String keyword) {
    // TODO: 검색 API 연동 후 결과 처리
    // 예시: Navigator.push(context, ...);
    print('검색어: $keyword');
    // 이후 결과 페이지로 이동 or setState로 결과 표시
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // ---- 검색창 추가 부분 ----
          TextField(
            controller: _searchController,
            onSubmitted: _onSearch,
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
          ),
          const SizedBox(height: 24),
          // ---- 카테고리 그리드 ----
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: categories.sublist(0, 3).map((category) {
                      return Expanded(child: CategoryItem(category: category));
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    children: categories.sublist(3, 6).map((category) {
                      return Expanded(child: CategoryItem(category: category));
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    children: categories.sublist(6, 9).map((category) {
                      return Expanded(child: CategoryItem(category: category));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CategoryItem extends StatelessWidget {
  final Map category;
  const CategoryItem({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          // TODO: 카카오 지도 연동
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(category['icon'] as IconData, size: 40),
              const SizedBox(height: 8),
              Text(category['label'] as String, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('마이페이지'));
  }
}
