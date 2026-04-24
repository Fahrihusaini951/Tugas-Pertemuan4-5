import 'package:flutter/material.dart';

class PertemuanPage extends StatelessWidget {
  final List<String> data = ["Materi 1", "Materi 2", "Materi 3", "Materi 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pertemuan")),
      body: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(title: Text(data[index]));
        },
      ),
    );
  }
}
