import 'package:flutter/material.dart';

class ContentList extends StatefulWidget {
  const ContentList({super.key});

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  final List<String> itemList = [
    'Flutter',
    'ReactJS',
    'VueJS',
    'Tailwind CSS',
    'UI/UX',
    'Figma',
    'Digital Marketing',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            'Learn ${itemList[index]}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
