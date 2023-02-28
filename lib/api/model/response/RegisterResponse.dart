import 'ErrorResponse.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"rania@gmail.com","phone":"01010700700","password":"$2a$12$TXOuKtQqhqX0CjyA/CAh1ObZF6Qizs1y8pVadLRHxAr1MXCst5Mc2","role":"user","_id":"63f149ce569550dd604c5aaf","createdAt":"2023-02-18T21:57:34.243Z","updatedAt":"2023-02-18T21:57:34.243Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZjE0OWNlNTY5NTUwZGQ2MDRjNWFhZiIsImlhdCI6MTY3Njc1NzQ1NSwiZXhwIjoxNjg0NTMzNDU1fQ.I22qFCS2FrkkNMTkdUU25mBxFTtb755fvEW6FfK3zzE"

class RegisterResponse {
  User? user;
  String? token;
  List<ServerError>? errors;

  RegisterResponse({
      this.user, 
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    map['token'] = token;

    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;


  }

  String mergeError(){
    String message = '';
    errors?.forEach((error) {
      message += "${error.msg ?? ''} \n";
    });
    return message;
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "rania@gmail.com"
/// phone : "01010700700"
/// password : "$2a$12$TXOuKtQqhqX0CjyA/CAh1ObZF6Qizs1y8pVadLRHxAr1MXCst5Mc2"
/// role : "user"
/// _id : "63f149ce569550dd604c5aaf"
/// createdAt : "2023-02-18T21:57:34.243Z"
/// updatedAt : "2023-02-18T21:57:34.243Z"
/// __v : 0

class User {
  User({
      this.name, 
      this.email, 
      this.phone, 
      this.password, 
      this.role, 
      this.id, 
     this.createdAt, 
     this.updatedAt, 
     });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? name;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? id;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['role'] = role;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}