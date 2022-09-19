import 'package:flutter/material.dart';
import 'package:mimi/routes.dart';

import 'components/bottom_navigation.dart';
import 'components/info_page.dart';
import 'components/news/page.dart';
import 'components/questionnaires/availables/covid.dart';
import 'components/questionnaires/page.dart';
import 'components/contact_tracing_page.dart';
import 'components/questionnaires/results.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Mimi';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const MyStatefulWidget(),
      routes: {
        RouteConstants.covid19: (context) => const CovidQuestionnaire(),
        RouteConstants.questionnaireResults: (context) =>
            const QuestionnaireResults(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    QuestionnairesPage(),
    NewsPage(),
    ContactTracingPage(),
    InfoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Mimi'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
