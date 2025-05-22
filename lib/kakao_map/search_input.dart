import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final Function(String) onSearch;
  const SearchInput({super.key, required this.onSearch});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '장소 키워드로 검색',
                border: OutlineInputBorder(),
              ),
              onSubmitted: widget.onSearch,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => widget.onSearch(_controller.text),
          ),
        ],
      ),
    );
  }
}
