import 'package:flutter/material.dart';
//import 'package:ionicons/ionicons.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color chipColor = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    String? username = "User"; // Replace with dynamic username retrieval logic

    return Scaffold(
      backgroundColor: const Color(0xFF40A3B1),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF40A3B1), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, $username",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Let's Travel",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              // actions: const [
              //   IconButton(
              //     icon: Icon(Ionicons.search_outline, color: Colors.white),
              //     onPressed: null,
              //   ),
              //   Padding(
              //     padding: EdgeInsets.only(left: 8.0, right: 12),
              //     child: IconButton(
              //       icon: Icon(Ionicons.notifications_outline, color: Colors.white),
              //       onPressed: null,
              //     ),
              //   ),
              // ],
            ),
            const SizedBox(height: 20),
            LocationCard(
              chipColor: chipColor,
              onChipHover: (Color newColor) {
                setState(() {
                  chipColor = newColor;
                });
              },
            ),
            const SizedBox(height: 15),
            const TouristPlaces(),
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final Color chipColor;
  final void Function(Color) onChipHover;

  const LocationCard({
    Key? key,
    required this.chipColor,
    required this.onChipHover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF40A3B1),
      elevation: 0.4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for Places",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: ["Forest", "Mountains", "Beach", "City"].map((place) {
                return MouseRegion(
                  onEnter: (_) => onChipHover(Colors.lightBlue),
                  onExit: (_) => onChipHover(Colors.indigo),
                  child: Chip(
                    label: Text(
                      place,
                      style: TextStyle(color: chipColor),
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // Add tourist places widgets here
        Text("Explore tourist places here!"),
      ],
    );
  }
}
