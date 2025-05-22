import 'package:flutter/material.dart';
import 'community_detail.dart';
import 'communitypost.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Map<String, String>> posts = [];

  // 글쓰기 페이지로 이동 (Navigator)
  Future<void> _startPost() async {
    final post = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (_) => CommunityPost(),
      ),
    );
    if (post != null) {
      setState(() => posts.insert(0, post));
    }
  }

  // 상세페이지 이동 (Navigator)
  void _showDetail(Map<String, String> post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CommunityDetailPage(post: post),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 커뮤니티 글 리스트
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 24),
        itemCount: posts.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          thickness: 0.7,
          height: 24,
        ),
        itemBuilder: (context, index) {
          final post = posts[index];
          return InkWell(
            onTap: () => _showDetail(post),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.indigo.shade200),
                  ),
                  child: Text(
                    post['category']!,
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    post['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startPost,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, size: 32),
        tooltip: '글쓰기',
      ),
    );
  }
}
