import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('10/06/2023', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 4),
                const Text('06:34 PM'),
              ],
            ),
            const SizedBox(width: 21),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Falcon Heavy Test ',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Kennedy Space Center Historic Launch Complex 39A',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
