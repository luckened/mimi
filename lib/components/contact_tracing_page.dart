import 'package:flutter/material.dart';

class ContactTracingPage extends StatelessWidget {
  const ContactTracingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Text('Notícias'),
      ),
    );
  }
}
