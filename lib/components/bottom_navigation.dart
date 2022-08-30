import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const CustomBottomNavigationBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.medication_rounded),
          label: 'Questionnaire',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_rounded),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.radar),
          label: 'Contact Tracing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_rounded),
          label: 'Info',
        ),
      ],
      selectedItemColor: Colors.amber,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
