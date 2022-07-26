import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import '../../routes.dart';

class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

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
              Navigator.pushReplacementNamed(
                  context, RouteConstants.questionnaireResults,
                  arguments: result);
            },
            task: task,
            showProgress: true,
            localizations: const {
              'cancel': 'Cancel',
              'next': 'Next',
            },
            themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.cyan,
              ).copyWith(
                onPrimary: Colors.white,
              ),
              primaryColor: Colors.cyan,
              backgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.cyan,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.cyan,
              ),
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.cyan,
                selectionColor: Colors.cyan,
                selectionHandleColor: Colors.cyan,
              ),
              cupertinoOverrideTheme: const CupertinoThemeData(
                primaryColor: Colors.cyan,
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(150.0, 60.0),
                  ),
                  side: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> state) {
                      if (state.contains(MaterialState.disabled)) {
                        return const BorderSide(
                          color: Colors.grey,
                        );
                      }
                      return const BorderSide(
                        color: Colors.cyan,
                      );
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  textStyle: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> state) {
                      if (state.contains(MaterialState.disabled)) {
                        return Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.grey,
                            );
                      }
                      return Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.cyan,
                          );
                    },
                  ),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.cyan,
                        ),
                  ),
                ),
              ),
              textTheme: const TextTheme(
                headline2: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                ),
                headline5: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
                bodyText2: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                subtitle1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
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
    final taskJson = await rootBundle.loadString('assets/covid.json');
    final taskMap = json.decode(taskJson);

    return Task.fromJson(taskMap);
  }
}
