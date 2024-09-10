import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
    required this.percentage,
  });

  final double fill;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end, 
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: fill,
                    child: Container(
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.65),
                    ),
                  ),
                ),
              ),
            ),
            // Percentage Text
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                percentage,
                style: TextStyle(
                  color: isDarkMode
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
