import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }
}