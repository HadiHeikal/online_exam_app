import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/profile/data/models/change_password_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'profile_api_client.g.dart';

@singleton
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(ApiStrings.profileDataEndPoint)
  Future<UserResponse> getUserProfile();

  // @PUT(ApiStrings.editProfileEndPoint)
  // @MultiPart()
  // Future<UserResponse> updateProfile({
  //   @Part(name: 'firstName') String? firstName,
  //   @Part(name: 'lastName') String? lastName,
  //   @Part(name: 'email') String? email,
  //   @Part(name: 'phone') String? phone,
  //   @Part(name: 'profilePicture') MultipartFile? profilePicture,
  // });

  @PUT(ApiStrings.editProfileEndPoint)
  Future<UserResponse> updateProfile({
    @Body() required Map<String, dynamic> data,
  });

  // @PATCH(ApiStrings.changePasswordEndPoint)
  // Future<UserResponse> changePassword({
  //   @Body() required Map<String, dynamic> passwordData,
  // });

  @PATCH(ApiStrings.changePasswordEndPoint)
  Future<ChangePasswordResponse> changePassword({
    @Field('oldPassword') required String oldPassword,
    @Field('password') required String password,
    @Field('rePassword') required String rePassword,
  });
}
