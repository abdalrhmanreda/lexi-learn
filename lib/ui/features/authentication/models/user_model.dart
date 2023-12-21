import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? name;
  String? email;
  int? age;
  String? gender;

  UserModel({
    this.name,
    this.email,
    this.age,
    this.gender,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['fullName'];
    email = json['email'];
    age = json['profileImage'];
    gender = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = name;
    data['email'] = email;
    data['profileImage'] = age;
    data['address'] = gender;

    return data;
  }

  @override
  List<Object> get props => [name!, email!, age!, gender!];
}
