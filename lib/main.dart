import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> clothes = [
      {
        'name': 'Маичка',
        'image': 'assets/t-shirt.jpg',
        'description': 'Памучна маичка за секојдневна употреба.',
        'price': 500,
      },
      {
        'name': 'Фармерки',
        'image': 'assets/jeans.jpg',
        'description': 'Трендовски фармерки со висок квалитет.',
        'price': 1500,
      },
      {
        'name': 'Јакна',
        'image': 'assets/jacket.jpeg',
        'description': 'Топла зимска јакна со модерен дизајн.',
        'price': 2500,
      },
      {
        'name': 'Патики',
        'image': 'assets/shoes.jpeg',
        'description': 'Спортски патики идеални за трчање.',
        'price': 2000,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('213172'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset(item['image'],
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(item['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${item['price']} MKD'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item['image'], height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              item['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              item['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              '${item['price']} MKD',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
