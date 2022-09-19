import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

import 'dart:developer';

class QuestionnaireResults extends StatelessWidget {
  const QuestionnaireResults({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SurveyResult;
    inspect(args);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Questionnaire results'),
        ),
        body: Column());
  }
}
