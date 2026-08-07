import 'package:flutter/material.dart';
import 'package:online_exam_app/core/themes/app_%20text_styles/app_text_styles.dart';
import 'package:online_exam_app/features/get_exams/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/exam_header_widget.dart';
import 'package:online_exam_app/features/get_exams/presentation/view/widgets/instructions.item.dart';

class ExamInstructions extends StatelessWidget {
  final ExamEntity examEntity;

  const ExamInstructions({
    super.key,
    required this.examEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExamHeader(exam: examEntity),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Text(
              "Instructions",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 16),
            const InstructionItem(
              text: "Lorem ipsum dolor sit amet consectetur.",
            ),
            const InstructionItem(
              text: "Lorem ipsum dolor sit amet consectetur.",
            ),
            const InstructionItem(
              text: "Lorem ipsum dolor sit amet consectetur.",
            ),
            const InstructionItem(
              text: "Lorem ipsum dolor sit amet consectetur.",
            ),

            // const Spacer(),
            SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: TextButton(
          
                onPressed: () {},
                child:  Text("Start" , style: AppTextStyles.medium16,),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}


