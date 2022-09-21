import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

import 'dart:developer';

class QuestionnaireResults extends StatelessWidget {
  const QuestionnaireResults({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SurveyResult;
    final results = args.results;
    final stepResults =
        results.map((item) => item.results[0].valueIdentifier).toList();

    inspect(stepResults);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Questionnaire results'),
        ),
        body: Center(
            child: Column(children: [
          ...stepResults.map((result) => Text(result!)).toList(),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Back to home screen'))
        ])));
  }
}
