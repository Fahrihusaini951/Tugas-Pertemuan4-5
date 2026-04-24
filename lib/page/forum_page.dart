import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  final String title;
  final String subtitle;

  const ForumPage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF0A66C2)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(subtitle, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),

            Text(
              "Forum Diskusi:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("• Apa yang kamu pelajari di pertemuan ini?"),
            Text("• Ada kendala?"),
            Text("• Diskusi bersama teman 👇"),
          ],
        ),
      ),
    );
  }
}
