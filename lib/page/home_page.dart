import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget dashboardCard(String title, String value, Color color, IconData icon) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(title, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  Widget realChart() {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: false),

          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.orange,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.orange.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 5),
                FlSpot(2, 10),
                FlSpot(3, 12),
                FlSpot(4, 8),
                FlSpot(5, 15),
                FlSpot(6, 11),
                FlSpot(7, 13),
                FlSpot(8, 9),
                FlSpot(9, 17),
              ],
            ),

            LineChartBarData(
              isCurved: true,
              color: Colors.purple,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.purple.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              spots: const [
                FlSpot(0, 0),
                FlSpot(1, 4),
                FlSpot(2, 12),
                FlSpot(3, 5),
                FlSpot(4, 6),
                FlSpot(5, 7),
                FlSpot(6, 6),
                FlSpot(7, 11),
                FlSpot(8, 10),
                FlSpot(9, 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget realMap() {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(-6.200000, 106.816666),
            initialZoom: 10,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(-6.200000, 106.816666),
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chatBox() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Chat", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Fahri: Hallo Ada Yang Bisa Saya Bantu?"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F8),
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: const Color(0xFF0A66C2),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                dashboardCard("News", "150", Colors.blue, Icons.shopping_bag),
                dashboardCard(
                  "Bounce Rate",
                  "53%",
                  Colors.green,
                  Icons.show_chart,
                ),
              ],
            ),
            Row(
              children: [
                dashboardCard("Users Login", "20", Colors.orange, Icons.person),
                dashboardCard("Visitors", "65", Colors.red, Icons.pie_chart),
              ],
            ),

            realChart(),
            realMap(),
            chatBox(),
          ],
        ),
      ),
    );
  }
}
