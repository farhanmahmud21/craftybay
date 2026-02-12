

class UserModel {

  final String id;
  final String first_name;
  final String last_name;
  final String email;
  
  final String? phone;
  
  final String? avatar_url;
  final String? city;
   UserModel({required this.id, required this.first_name, required this.last_name,
   required this.email,  this.phone,  this.avatar_url, required this.city});


  factory UserModel.fromJson(Map<String,dynamic> jsonData){
    return UserModel(
      id: jsonData['_id'],
      first_name: jsonData['first_name'],
      last_name: jsonData['last_name'], 
      email: jsonData['email'],
      phone: jsonData['phone'], 
      avatar_url: jsonData['avatar_url'],
      city: jsonData['city']
    );

  }



  Map<String ,dynamic> toJson(){
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone': phone,
      'avatar_url': avatar_url,
      'city': city
    };
  }
}