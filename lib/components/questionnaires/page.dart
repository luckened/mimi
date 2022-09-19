import 'package:flutter/material.dart';
import 'package:mimi/components/questionnaires/card.dart';

import '../../routes.dart';

class QuestionnairesPage extends StatelessWidget {
  const QuestionnairesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(
      children: const [
        QuestionnairesCard(
          image: 'https://placekitten.com/200/300',
          title: 'Covid-19',
          description: 'Do this test to COVID-19 autodiagnosis',
          route: RouteConstants.covid19,
        ),
        QuestionnairesCard(
          image: 'https://placekitten.com/200/300',
          description: 'sdfsdfsdf',
          route: '/aasdasd',
          title: 'asdasdasd',
        ),
      ],
    )));
  }
}
