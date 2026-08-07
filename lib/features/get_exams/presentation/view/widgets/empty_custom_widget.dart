import 'package:flutter/material.dart';

class EmptyCustomWidget extends StatelessWidget {
  const EmptyCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 64, color: Colors.blue[300]),
            const SizedBox(height: 16),
            const Text(
              'No exams available',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
