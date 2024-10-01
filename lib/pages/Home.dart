import 'package:flutter/material.dart';
import 'package:nilai/pages/Class.dart';
import 'package:nilai/pages/Students.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool dark;

  const HomePage({super.key, required this.onToggleTheme, required this.dark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Score Avg Counter'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
        backgroundColor: dark ? Colors.purple[400] : Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Students(
                            dark: dark,
                          )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: dark ? Colors.purple[400] : Colors.green,
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'Student',
                    style: TextStyle(
                      color: dark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Class(
                            dark: dark,
                          )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: dark ? Colors.purple[400] : Colors.green,
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'Class',
                    style: TextStyle(
                      color: dark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
