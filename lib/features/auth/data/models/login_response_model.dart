class UserModel{
  int? id;
  String? username;
  String? imagePath;

  UserModel({this.id, this.username, this.imagePath});
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    imagePath = json['image_path'];
  }
}
class LoginResponseModel{
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  LoginResponseModel({this.accessToken, this.refreshToken, this.status, this.user});
  LoginResponseModel.fromJson(Map<String, dynamic> json){
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    if(json['user'] != null){
      user = UserModel.fromJson(json['user']);
    }
  }
}