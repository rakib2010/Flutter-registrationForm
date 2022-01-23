class User{
  String name;
  String username;
  String password;
  String address;
  String course;
  String gender;

//<editor-fold desc="Data Methods">

  User({
    required this.name,
    required this.username,
    required this.password,
    required this.address,
    required this.course,
    required this.gender,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          username == other.username &&
          password == other.password &&
          address == other.address &&
          course == other.course &&
          gender == other.gender);

  @override
  int get hashCode =>
      name.hashCode ^
      username.hashCode ^
      password.hashCode ^
      address.hashCode ^
      course.hashCode ^
      gender.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' name: $name,' +
        ' username: $username,' +
        ' password: $password,' +
        ' address: $address,' +
        ' course: $course,' +
        ' gender: $gender,' +
        '}';
  }

  User copyWith({
    String? name,
    String? username,
    String? password,
    String? address,
    String? course,
    String? gender,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      address: address ?? this.address,
      course: course ?? this.course,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'username': this.username,
      'password': this.password,
      'address': this.address,
      'course': this.course,
      'gender': this.gender,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      course: map['course'] as String,
      gender: map['gender'] as String,
    );
  }

//</editor-fold>
}