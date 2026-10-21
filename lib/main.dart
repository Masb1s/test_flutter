import 'package:flutter/material.dart';
import 'widgets/contact_card.dart';

void main() {
  runApp(const DeveloperCardApp());
}

class DeveloperCardApp extends StatefulWidget {
  const DeveloperCardApp({super.key});

  @override
  State<DeveloperCardApp> createState() => _DeveloperCardAppState();
}

class _DeveloperCardAppState extends State<DeveloperCardApp> {
  bool isDarkTheme = false;

  void changeTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Card',
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark(),
      home: DeveloperScreen(
        onThemeChanged: changeTheme,
      ),
    );
  }
}

class DeveloperScreen extends StatelessWidget {
  final VoidCallback onThemeChanged;

  const DeveloperScreen({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Візитівка розробника'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Максим',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 10),

            Text(
              'Студент групи оІк-43"',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 30),

            const ContactCard(
              icon: Icons.email,
              text: 'm.kuzmenko@istu.edu.ua',
            ),

            const ContactCard(
              icon: Icons.code,
              text: 'github.com/Masb1s',
            ),

            const ContactCard(
              icon: Icons.chat,
              text: 'Discord: Masb1s',
            ),

            const ContactCard(
              icon: Icons.phone,
              text: '+48 123 123 123',
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: onThemeChanged,
              child: const Text('Змінити тему'),
            ),
          ],
        ),
      ),
    );
  }
}