import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/constants/app_strings.dart';

import 'package:online_exam_app/core/themes/app_colors/app_colors.dart';

import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_cubit.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_events.dart';
import 'package:online_exam_app/features/home/presentation/manager/cubit/subject_state.dart';

import 'package:online_exam_app/features/home/presentation/view/widgets/body_subject_view.dart';

class SubjectHomeView extends StatefulWidget {
  const SubjectHomeView({super.key});

  @override
  State<SubjectHomeView> createState() => _SubjectHomeViewState();
}

class _SubjectHomeViewState extends State<SubjectHomeView> {
  @override
  Widget build(BuildContext context) {
    SubjectCubit subjectCubit = getIt.get<SubjectCubit>();

    return BlocProvider<SubjectCubit>(
      create: (context) => subjectCubit..doEvent(GetSubjectsEvent()),
      child: Scaffold(
        body: SafeArea(child: BodySubjectView(subjectCubit: subjectCubit)),

        bottomNavigationBar: BlocBuilder<SubjectCubit, SubjectState>(
          builder: (context, state) {
            return NavigationBar(
              selectedIndex: state.tabIndex,
              onDestinationSelected: (index) {
                subjectCubit.doEvent(SelectedTabeEvent(index: index));
              },
              indicatorColor: AppColors.blue10,

              destinations:  [
                NavigationDestination(

                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home,color:AppColors.blue ),
                  label: AppStrings.exploreHomeView,

                ),
                NavigationDestination(
                  icon: Icon(Icons.description_outlined),
                  selectedIcon: Icon(Icons.description,color:AppColors.blue),
                  label: AppStrings.resultHomeView,
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person,color:AppColors.blue),
                  label: AppStrings.profileHomeView,
                ),
              ],
            );
          },
        ),

        // bottomNavigationBar: BlocBuilder<SubjectCubit, SubjectState>(
        //   builder: (context, state) {
        //     return BottomNavigationBar(
        //       selectedLabelStyle: AppTextStyles.regular16.copyWith(fontWeight: FontWeight.w600),
        //       unselectedLabelStyle: AppTextStyles.regular14,

        //       currentIndex: state.tabIndex,
        //       onTap: (index) {
        //         subjectCubit.doEvent(SelectedTabeEvent(index: index));
        //       },
        //       items:  [
        //         BottomNavigationBarItem(

        //           // backgroundColor: AppColors.error,
        //           icon: Icon(Icons.home , color: AppColors.blue,),
        //           label:AppStrings.exploreHomeView,
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.description, color: AppColors.blue,),
        //           label: AppStrings.resultHomeView,
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.person, color: AppColors.blue,),
        //           label: AppStrings.profileHomeView,
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}

//  Widget _buildBody(
//     BuildContext context,
//     SubjectState state,
//     SubjectCubit subjectCubit,
//   ) {
//     switch (state.selectedTabIndex) {
//       case 0:
//         return _buildExploreTab(context, state, subjectCubit);
//       case 1:
//         return _buildResultTab();
//       case 2:
//         return _buildProfileTab();
//       default:
//         return _buildExploreTab(context, state, subjectCubit);
//     }}
