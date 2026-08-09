sealed class ExamsEvent {}

class GetAllSubjectExams extends ExamsEvent {
   final String subjectId;
    GetAllSubjectExams(this.subjectId);
}