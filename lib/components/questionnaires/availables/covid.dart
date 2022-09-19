import 'package:flutter/material.dart';
import 'package:mimi/routes.dart';
import 'package:mimi/components/questionnaires/questionnaire.dart';

class CovidQuestionnaire extends StatelessWidget {
  const CovidQuestionnaire({super.key});

  static const routeName = RouteConstants.covid19;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return QuestionnairePage();
  }
}
