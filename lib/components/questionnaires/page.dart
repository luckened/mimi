import 'package:flutter/material.dart';

class QuestionnairesPage extends StatelessWidget {
  const QuestionnairesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Text('Questionários'),
      ),
    );
  }
}
