/// status : 200
/// account : [{"id":1,"name":"ahmed","email":"ahmed@gmail.com","password":"123456","phone":"0112555","updated_at":"2022-05-26 08:17:41","created_at":"2022-05-26 08:17:41"}]

class LoginModel {
  LoginModel({
      int? status, 
      List<Account>? account,}){
    _status = status;
    _account = account;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['account'] != null) {
      _account = [];
      json['account'].forEach((v) {
        _account?.add(Account.fromJson(v));
      });
    }
  }
  int? _status;
  List<Account>? _account;

  int? get status => _status;
  List<Account>? get account => _account;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_account != null) {
      map['account'] = _account?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "ahmed"
/// email : "ahmed@gmail.com"
/// password : "123456"
/// phone : "0112555"
/// updated_at : "2022-05-26 08:17:41"
/// created_at : "2022-05-26 08:17:41"

class Account {
  Account({
      int? id, 
      String? name, 
      String? email, 
      String? password, 
      String? phone, 
      String? updatedAt, 
      String? createdAt,}){
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _phone = phone;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Account.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _phone;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get phone => _phone;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}