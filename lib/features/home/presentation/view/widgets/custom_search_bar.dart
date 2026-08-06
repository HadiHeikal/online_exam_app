import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_cubit.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_events.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.subjectCubit});
  final SubjectCubit subjectCubit;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      onChanged: (value) {
        widget.subjectCubit.doEvent(ShowSearchResult(query: value));
        setState(() {});
      },
      decoration: InputDecoration(
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  controller.clear();
                  widget.subjectCubit.doEvent(ShowSearchResult());
                },
                icon: const Icon(Icons.clear, color: Colors.grey),
              )
            : null,
        hintText: AppStrings.search,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }
}
