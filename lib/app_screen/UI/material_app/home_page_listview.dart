import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class HomePageListView extends StatefulWidget {
  const HomePageListView({super.key});

  @override
  State<HomePageListView> createState() => _HomePageListViewState();
}

class _HomePageListViewState extends State<HomePageListView> {
  List<Map<String, String>> contacts = [
    {'name': 'Leanne Graham', 'phone': '1-770-736-8031 x56442'},
    {'name': 'Ervin Howell', 'phone': '010-692-6593 x09125'},
    {'name': 'Clementine Bauch', 'phone': '1-463-123-4447'},
    {'name': 'Patricia Lebsack', 'phone': '493-170-9623 x156'},
    {'name': 'Chelsey Dietrich', 'phone': '(254)954-1289'},
    {'name': 'Mrs. Dennis Schulist', 'phone': '1-477-935-8478 x6430'},
    {'name': 'Kurtis Weissnat', 'phone': '210.067.6132'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, index) {
        final contact = contacts[index];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Initicon(
                text: contact['name']?[0],
                backgroundColor: const Color.fromARGB(255, 102, 169, 88),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contact['name']!),
                    Text(contact['phone']!),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
