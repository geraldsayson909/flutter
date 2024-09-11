import 'package:flutter/material.dart';
import 'package:todo_app/demo_buttons.dart';

class UIUpdatesDemo extends StatelessWidget {
  const UIUpdatesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    print('UI UPDATES DEMO BUILD CALLED');
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Every Flutter Developer should have a basic understanding of Flutter\'s internal',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 15),
            Text(
              'Do you understand how Flutter updates Ui\'s?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            DemoButtons(),
          ],
        ),
      ),
    );
  }
}
