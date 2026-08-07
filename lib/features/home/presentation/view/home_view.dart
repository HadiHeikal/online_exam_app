import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';
import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_cubit.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_events.dart';
import 'package:online_exam_app/features/home/presentation/manager/navigation_cubit/cubit/navigation_cubit.dart';
import 'package:online_exam_app/features/home/presentation/view/profile_view.dart';
import 'package:online_exam_app/features/home/presentation/view/result_view.dart';
import 'package:online_exam_app/features/home/presentation/view/widgets/body_subject_view.dart';
import 'package:online_exam_app/features/home/presentation/view/widgets/custom_navigation_destination.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [BodySubjectView(), ResultView(), ProfileView()];

    return MultiBlocProvider(
      providers: [
        BlocProvider<SubjectCubit>(
          create: (context) =>
              getIt.get<SubjectCubit>()..doEvent(GetSubjectsEvent()),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => getIt.get<NavigationCubit>(),
        ),
      ],

      child: Builder(
        builder: (context) {
          var navigationCubit = context.read<NavigationCubit>();
          return Scaffold(
            body: BlocBuilder<NavigationCubit, int>(
              builder: (context, tabeIndex) {
                return SafeArea(child: tabs[tabeIndex]);
              },
            ),

            bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
              builder: (context, tabIndex) {
                return NavigationBar(
                  selectedIndex: tabIndex,
                  onDestinationSelected: (index) {
                    navigationCubit.changeIndex(index);
                  },
                  indicatorColor: AppColors.blue10,
                  destinations: [
                    CustomNavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      iconSelected: Icon(Icons.home, color: AppColors.blue),
                      label: AppStrings.exploreHomeView,
                    ),
                    CustomNavigationDestination(
                      icon: Icon(Icons.description_outlined),
                      iconSelected: Icon(
                        Icons.description,
                        color: AppColors.blue,
                      ),
                      label: AppStrings.resultHomeView,
                    ),
                    CustomNavigationDestination(
                      icon: Icon(Icons.person_outline),
                      iconSelected: Icon(Icons.person, color: AppColors.blue),
                      label: AppStrings.profileHomeView,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
