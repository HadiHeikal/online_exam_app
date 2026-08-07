import 'package:flutter/material.dart';

import '../../../../../core/themes/app_ text_styles/app_text_styles.dart';

class CustomSubjectCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback? onTap;

  const CustomSubjectCard({super.key, required this.name, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            child: Row(
              children: [
                // Icon/Image
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
             
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.book, color: Colors.blue[400], size: 24);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Text
                Expanded(
                  child: Text(
                    name,
                    style: AppTextStyles.regular16
                  ),
                ),
                // Arrow
           
              ],
            ),
          ),
        ),
      ),
    );
  }
}