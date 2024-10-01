import 'package:flutter/material.dart';

class Class extends StatefulWidget {
  final bool dark;

  const Class({super.key, required this.dark});

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {
  final List<String> _scores = [];
  final TextEditingController _scoreController = TextEditingController();
  String _result = '';

  void _addScore() {
    final score = _scoreController.text;

    if (score.isNotEmpty &&
        int.tryParse(score) != null &&
        int.tryParse(score)! >= 0 &&
        int.tryParse(score)! <= 100) {
      setState(() {
        _scores.add(score);
        _scoreController.clear();
        _result = 'Score Added: $score';
      });
    } else {
      setState(() {
        _result = 'Please enter a valid score (0-100).';
      });
    }
  }

  void _calculateAverage() {
    if (_scores.isEmpty) {
      setState(() {
        _result = 'No scores entered.';
      });
      return;
    }

    int total = _scores.fold(0, (sum, score) => sum + int.parse(score));
    double average = total / _scores.length;

    String gradeCategory;
    if (average >= 85) {
      gradeCategory = 'A';
    } else if (average >= 70) {
      gradeCategory = 'B';
    } else if (average >= 55) {
      gradeCategory = 'C';
    } else {
      gradeCategory = 'D';
    }

    setState(() {
      _result =
          'Average: ${average.toStringAsFixed(2)} - Grade: $gradeCategory';
    });
  }

  void _deleteAllScores() {
    setState(() {
      _scores.clear();
      _result = 'All scores deleted.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Average Score Calculator',
          style: TextStyle(color: widget.dark ? Colors.white : Colors.black),
        ),
        backgroundColor: widget.dark ? Colors.purple[400] : Colors.green,
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
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Enter student score (0-100)',
                hintStyle: TextStyle(
                  color: widget.dark ? Colors.white : Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _addScore,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                color: widget.dark ? Colors.purple[400] : Colors.green,
                child: Center(
                  child: Text(
                    'Add Score',
                    style: TextStyle(
                        color: widget.dark ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _calculateAverage,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                color: widget.dark ? Colors.purple[400] : Colors.green,
                child: Center(
                  child: Text(
                    'Calculate Average',
                    style: TextStyle(
                        color: widget.dark ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _deleteAllScores,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                color: Colors.red, 
                child: Center(
                  child: Text(
                    'Delete All Scores',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.dark ? Colors.white : Colors.black),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _scores.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: widget.dark ? Colors.white : Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        '${_scores[index]}',
                        style: TextStyle(
                            color: widget.dark ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
