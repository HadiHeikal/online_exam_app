import 'package:online_exam_app/features/auth/domain/entities/params/params/register_params.dart';

sealed class RegisterEvent { 
  const RegisterEvent();

}
class RegisterEventRegister extends RegisterEvent {
  final RegisterParams registerParams;
  const RegisterEventRegister({required this.registerParams});
}