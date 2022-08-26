import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class QuestionnairesPage extends StatelessWidget {
  const QuestionnairesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Task>(
      future: getJsonTask(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data != null) {
          final task = snapshot.data!;
          return SurveyKit(
            onResult: (SurveyResult result) {
              print(result.finishReason);
              Navigator.pushNamed(context, '/');
            },
            task: task,
            showProgress: true,
            localizations: const {
              'cancel': 'Cancel',
              'next': 'Next',
            },
            surveyProgressbarConfiguration: SurveyProgressConfiguration(
              backgroundColor: Colors.white,
            ),
          );
        }
        return const CircularProgressIndicator.adaptive();
      },
    );
  }

  Future<Task> getJsonTask() async {
    final taskJson = await rootBundle.loadString('assets/example_json.json');
    final taskMap = json.decode(taskJson);

    return Task.fromJson(taskMap);
  }
}
