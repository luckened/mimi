import 'package:flutter/material.dart';
import './questionnaires_card.dart';

class QuestionnairesPage extends StatelessWidget {
  const QuestionnairesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: const [
      QuestionnairesCard(
        title: 'Autodiagnóstico',
        description:
            'Esse questionário irá te guiar para o diagnóstico de covid, respondendo algumas perguntas podemos ajudar a identificar se você está com covid ou não.',
        image: 'https://placekitten.com/450/200',
        route: 'blablabla',
      ),
    ]));
  }
}
