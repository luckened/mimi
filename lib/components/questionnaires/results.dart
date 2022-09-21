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
    stepResults.removeAt(0);
    String text = '';

    if (stepResults.contains('Yes')) {
      text = 'You have a high risk of having COVID-19';
    } else {
      text = 'You have a low risk of having COVID-19';
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Questionnaire results'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              ...stepResults
                  .map((result) => Text(
                        result!,
                        style: const TextStyle(fontSize: 20),
                      ))
                  .toList(),
              Text(text, style: TextStyle(color: Colors.red, fontSize: 30)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Text('Back to home screen'))),
            ],
          ),
        )));
  }
}
