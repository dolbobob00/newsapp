import 'package:flutter/material.dart';

import '../../../widgets/share_button.dart';

class IdInfoCard extends StatelessWidget {
  const IdInfoCard({super.key, this.userId, this.id});
  final String? userId;
  final String? id;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      'Author ID: $userId',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.numbers, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      'Article ID: $id',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ShareButton(
                idOfNews: id ?? '404',
              ),
            )
          ],
        ),
      ),
    );
  }
}
