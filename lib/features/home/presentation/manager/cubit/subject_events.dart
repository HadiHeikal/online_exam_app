sealed class SubjectEvents {}

class GetSubjectsEvent extends SubjectEvents {}
class ShowExploreEvent extends SubjectEvents {}
class ShowResultEvent extends SubjectEvents {}
class ShowProfileEvent extends SubjectEvents {}
class ShowSearchResult extends SubjectEvents {
  String? query;
  ShowSearchResult({this.query});
}
class SelectedTabeEvent extends SubjectEvents {
  final int index;
  SelectedTabeEvent({required this.index});
}
