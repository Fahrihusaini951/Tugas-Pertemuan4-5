import 'package:flutter/material.dart';
import 'forum_page.dart';

class ListPertemuanPage extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"title": "Pertemuan 1", "subtitle": "Pengenalan Android"},
    {"title": "Pertemuan 2", "subtitle": "Widget & Button"},
    {"title": "Pertemuan 3", "subtitle": "Activity & Intent"},
    {"title": "Pertemuan 4", "subtitle": "Toast & AlertDialog"},
    {"title": "Pertemuan 5", "subtitle": "ListView"},
    {"title": "Pertemuan 6", "subtitle": "Checkbox"},
    {"title": "Pertemuan 7", "subtitle": "Radio Button"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pertemuan 5"),
        backgroundColor: Color.fromARGB(255, 62, 154, 117),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.menu),
              title: Text(data[index]["title"]!),
              subtitle: Text(data[index]["subtitle"]!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ForumPage(
                      title: data[index]["title"]!,
                      subtitle: data[index]["subtitle"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
