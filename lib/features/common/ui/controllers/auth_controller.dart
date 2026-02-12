


import 'dart:convert';
import 'dart:developer';

import 'package:craftybay/features/common/ui/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
final String _userDataKey='user_data';
final String _tokenKey='access-token';

UserModel? _userModel;
String? accessToken;

  
Future<void> saveUserData(String token,UserModel model) async{


  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
await sharedPreferences.setString(_tokenKey,token);

_userModel=model;
accessToken=token;
print('User Data Saved');
print(_userModel);
print(accessToken);
}

Future<void > getUserData() async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
String?userData=sharedPreferences.getString(_userDataKey);
String? tokenData=sharedPreferences.getString(_tokenKey);
if(userData!=null){
  _userModel=UserModel.fromJson(jsonDecode(userData));
  accessToken=tokenData;
}

}

Future<bool> isLoggedIn()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  String? tokenData=sharedPreferences.getString(_tokenKey);
  if(tokenData!=null){
    getUserData();
    return true;
  }
  return false;
}

Future<void> clearUsereData() async{
  SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  await sharedPreferences.clear();

  _userModel=null;
  accessToken=null;
}


}