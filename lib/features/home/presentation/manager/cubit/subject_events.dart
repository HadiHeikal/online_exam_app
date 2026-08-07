sealed class SubjectEvents {}

class GetSubjectsEvent extends SubjectEvents {}
class ShowSearchResult extends SubjectEvents {
 final String? query;
  ShowSearchResult({this.query});
}
