class User {
  User(this._name, this._email, this._password, this._weight, this._height,
      this._age, this._city, this._country, this._slogan, this._date,);
  String? _name;
  String? _email;
  String? _password;
  int? _weight = 0;
  int? _height = 0;
  int? _age = 0;
  String? _city = '';
  String? _country = '';
  String? _slogan = '';
  String? _date = '';

  String get name => _name!;
  String get email => _email!;
  String get password => _password!;
  int get weight => _weight!;
  int get height => _height!;
  int get age => _age!;
  String get city => _city!;
  String get country => _country!;
  String get slogan => _slogan!;
  String get date => _date!;

  set name(String? name) => _name = name;
  set email(String? email) =>_email = email;
  set password(String? password) =>_password = password;
  set weight(int? weight) => _weight = weight;
  set height(int? height) =>_height = height;
  set age(int? age) => _age = age;
  set city(String? city) => _city = city;
  set country(String? country) => _country = country;
  set slogan(String? slogan) => _slogan = slogan;
  set date(String? date) => _date = date;
}
