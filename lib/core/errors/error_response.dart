class ErrorResponse {
  ErrorResponse({
    String? status,
    String? message,
    Errors? errors,
  }) {
    _status = status;
    _message = message;
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  String? _status;
  String? _message;
  Errors? _errors;

  ErrorResponse copyWith({
    String? status,
    String? message,
    Errors? errors,
  }) =>
      ErrorResponse(
        status: status ?? _status,
        message: message ?? _message,
        errors: errors ?? _errors,
      );

  String? get status => _status;

  String? get message => _message;

  Errors? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }
}

class Errors {
  Errors({
    List<String>? firstName,
    List<String>? lastName,
    List<String>? email,
    List<String>? phone,
    List<String>? password,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _password = password;
  }

  Errors.fromJson(dynamic json) {
    _firstName =
        json['first_name'] != null ? json['first_name'].cast<String>() : [];
    _lastName =
        json['last_name'] != null ? json['last_name'].cast<String>() : [];
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    _password = json['password'] != null ? json['password'].cast<String>() : [];
  }

  List<String>? _firstName;
  List<String>? _lastName;
  List<String>? _email;
  List<String>? _phone;
  List<String>? _password;

  Errors copyWith({
    List<String>? firstName,
    List<String>? lastName,
    List<String>? email,
    List<String>? phone,
    List<String>? password,
  }) =>
      Errors(
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        phone: phone ?? _phone,
        password: password ?? _password,
      );

  List<String>? get firstName => _firstName;

  List<String>? get lastName => _lastName;

  List<String>? get email => _email;

  List<String>? get phone => _phone;

  List<String>? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    return map;
  }
}
