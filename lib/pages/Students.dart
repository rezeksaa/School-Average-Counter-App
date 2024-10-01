import 'package:flutter/material.dart';

class Students extends StatefulWidget {
  final bool dark;

  const Students({super.key, required this.dark});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  final TextEditingController _scoreController = TextEditingController();
  String _result = '';

  void _calculateGrade() {
    final score = int.tryParse(_scoreController.text);

    if (score == null || score < 0 || score > 100) {
      setState(() {
        _result = 'Please enter a valid score (0-100).';
      });
      return;
    }

    String gradeCategory;
    if (score >= 85) {
      gradeCategory = 'A';
    } else if (score >= 70) {
      gradeCategory = 'B';
    } else if (score >= 55) {
      gradeCategory = 'C';
    } else {
      gradeCategory = 'D';
    }

    setState(() {
      _result = 'Grade: $gradeCategory';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Grades',
          style: TextStyle(color: widget.dark ? Colors.white : Colors.black),
        ),
        backgroundColor: widget.dark? Colors.purple[400] : Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _scoreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter student score (0-100)',
                hintStyle: TextStyle(
                  color: widget.dark ? Colors.white : Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _calculateGrade,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                color: widget.dark? Colors.purple[400] : Colors.green,
                child: Center(
                  child: Text(
                    'Count',
                    style: TextStyle(color: widget.dark ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: widget.dark? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
